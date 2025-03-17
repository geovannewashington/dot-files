#!/bin/bash

# Diretório do backup
BACKUP_DIR=~/backup-configs-public

# Arquivos e diretórios a serem copiados
declare -A FILES_TO_BACKUP=(
    ["$HOME/.config/nvim"]="$BACKUP_DIR/nvim"
    ["$HOME/.config/alacritty/alacritty.toml"]="$BACKUP_DIR/alacritty.toml"
    ["$HOME/.config/BetterDiscord/themes"]="$BACKUP_DIR/DiscordThemes"
    ["$HOME/.config/devilspie2"]="$BACKUP_DIR/devilspie2"
    ["$HOME/.config/lf"]="$BACKUP_DIR/lf"
    ["$HOME/.config/screenkey.json"]="$BACKUP_DIR/screenkey.json"
    ["$HOME/.zshrc"]="$BACKUP_DIR/zshrc"
    ["$HOME/.xprofile"]="$BACKUP_DIR/xprofile"
    ["$HOME/.Xmodmap"]="$BACKUP_DIR/Xmodmap"
    ["$HOME/.tmux.conf"]="$BACKUP_DIR/tmux.conf"
    ["$HOME/.bashrc"]="$BACKUP_DIR/bashrc"
    ["$HOME/my-bash-scripts"]="$BACKUP_DIR/my-bash-scripts"
    ["$HOME/.local/share/Anki2"]="$BACKUP_DIR/Anki"
    ["$HOME/.local/share/fonts"]="$BACKUP_DIR/fonts"
    ["$HOME/.profile"]="$BACKUP_DIR/profile"
    ["$HOME/.zshenv"]="$BACKUP_DIR/zshenv"
)

# Copiar arquivos e diretórios para o diretório de backup
for SRC in "${!FILES_TO_BACKUP[@]}"; do
    DEST="${FILES_TO_BACKUP[$SRC]}"

    # Se for um diretório, usa rsync; se for um arquivo, usa cp
    if [ -d "$SRC" ]; then
        rsync -a --delete "$SRC/" "$DEST/"
    elif [ -f "$SRC" ]; then
        cp "$SRC" "$DEST"
    fi
done

# Remover repositórios Git embutidos dentro dos subdiretórios, MAS NÃO do backup principal
find "$BACKUP_DIR" -mindepth 2 -type d -name ".git" -exec rm -rf {} +

# Ir para o diretório do backup
cd $BACKUP_DIR || exit

# Adicionar ao Git
git add .

# Fazer commit com timestamp
git commit -m "Backup automático $(date '+%Y-%m-%d %H:%M:%S')"

# Enviar para o GitHub
git push origin main
