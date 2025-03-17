#firefox "https://dashboard.twitch.tv/u/tposeprogrammer/stream-manager" "https://pomofocus.io/" &
#gnome-terminal -- zsh -i -c "pg; exit" &
#gnome-terminal -- zsh -c "source ~/.zshrc && btop; exec zsh" &
#screenkey &
#obs --no-sandbox &

#!/bin/bash
xmodmap ~/.Xmodmap

# Open Firefox with Twitch dashboard and Pomofocus
firefox "https://dashboard.twitch.tv/u/tposeprogrammer/stream-manager" "https://pomofocus.io/" &

# Open Alacritty, cd into ~/Desktop/playground, and then start nvim
# alacritty -e zsh -c "cd ~/Desktop/playground && nvim; zsh" &
alacritty -e zsh -c "tmux new-session -s work 'cd ~/Desktop/playground && nvim; zsh' \; new-window 'cd ~/ && zsh' \; select-window -t 0 && zsh" &

# Start screenkey for keystroke visualization
screenkey &

# Start OBS without sandbox
obs --no-sandbox &
