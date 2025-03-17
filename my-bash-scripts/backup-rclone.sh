#!/bin/bash

# Diretório remoto no Google Drive
BACKUP_REMOTE="gvn_rclone"
LOG_FILE="$HOME/backup_rclone.log"

# Limpa o log anterior
echo "🔹 Iniciando backup em $(date)" >"$LOG_FILE"

# Lista de diretórios para backup
declare -A FILES_TO_BACKUP=(
    ["$HOME/stream_recourses"]="$BACKUP_REMOTE:stream-recourses"
    ["$HOME/roms"]="$BACKUP_REMOTE:roms"
    ["$HOME/Pictures"]="$BACKUP_REMOTE:Pictures"
    ["$HOME/Documents/PDF files"]="$BACKUP_REMOTE:PDF_files"
    ["$HOME/Desktop/Books"]="$BACKUP_REMOTE:Books"
    ["$HOME/Desktop/Notes"]="$BACKUP_REMOTE:Notes"
    ["$HOME/.themes"]="$BACKUP_REMOTE:themes"
    ["$HOME/.icons"]="$BACKUP_REMOTE:icons"
)

# Sincroniza os arquivos
for SRC in "${!FILES_TO_BACKUP[@]}"; do
    DEST="${FILES_TO_BACKUP[$SRC]}"

    if [ -d "$SRC" ]; then
        echo "🔹 Sincronizando $SRC para $DEST..." | tee -a "$LOG_FILE"

        # Usa rclone sync para manter os arquivos idênticos no destino
        rclone sync "$SRC" "$DEST" --progress --transfers=4 --checkers=8 --ignore-errors --checksum --log-file="$LOG_FILE"

        if [ $? -eq 0 ]; then
            echo "✅ Backup de $SRC concluído com sucesso!" | tee -a "$LOG_FILE"
        else
            echo "❌ Erro ao sincronizar $SRC. Verifique o log." | tee -a "$LOG_FILE"
        fi
    else
        echo "⚠️ Diretório $SRC não encontrado. Pulando..." | tee -a "$LOG_FILE"
    fi
done

echo "✅ Backup finalizado em $(date)" | tee -a "$LOG_FILE"
