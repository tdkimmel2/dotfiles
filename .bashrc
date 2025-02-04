#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file)
if [ "$EUID" -ne 0 ]
    then export PS1="[\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;88m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\h\[$(tput sgr0)\]: \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;69m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$\[$(tput sgr0)\]"
    else export PS1="[\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;88m\]ROOT\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]$(hostname | awk '{print toupper($0)}') \[$(tput sgr0)\]: \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;69m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$\[$(tput sgr0)\]"
fi

# Set default terminal
export TERMINAL=st

# Add scripts directory to $PATH
export PATH=$PATH:~/.scripts:~/builds/dwmblocks/scripts:~/Projects/Physics/rust_physics/

# Ignore duplicate entries in bash history that appear consecutively
export HISTCONTROL=ignoreboth:erasedups

# Run ssh agent on start and make sure only one agent is running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Set vi mode for command line
set -o vi

# Source root
#source /home/tkimmel/builds/root/rootInstall/bin/thisroot.sh
# Configure garfield
#export GARFIELD_HOME=/home/tkimmel/builds/garfield
#source $GARFIELD_HOME/install/share/Garfield/setupGarfield.sh

####################################################################
###############################Aliases##############################
####################################################################

# Ask to move/remove/copy files
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# List options and aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias sl='ls -hN --color=auto --group-directories-first'
alias ll='ls -lhart --color=auto --group-directories-first'
alias lsd='ls -d */' # List only directories

# grep with color
alias grep='grep --color=always'

# vim alias
alias vim='nvim'
alias ovim='/usr/bin/vim'

alias pcm='sudo pacman' # -S to install, -Rns to remove+dependencies+config files
alias sysupdate='sudo systemctl start reflector.service && yay' # Get fastest mirrors and update
alias cln='yay -Yc && sudo paccache -rk1' # Cleans out pacman cache and only keeps last version, not all previous versions
alias mkpkg='makepkg -si' # Make package from AUR
alias SS='sudo systemctl'
alias psg='ps aux | grep' # ps command
alias dush='du -sh * | sort -h'
alias disex='disown & exit' # Disown from terminal then exit terminal

alias ccat='highlight --out-format=ansi' # cat with syntax highlighting shortcut
alias starwars='telnet towel.blinkenlights.nl'
alias wthr='curl wttr.in' # Display weather
alias als='alsamixer' # Shortcut for alsamixer
alias yta='youtube-dl -x -f bestaudio' # Download only audio from youtube link
alias jn='jupyter notebook' # Open jupyter notebook

# Directory Shortcuts
alias fgdir='cd /home/tkimmel/.smiteworks/fgdata'
alias ttsdir='cd /home/tkimmel/.local/share/Tabletop\ Simulator'
alias nmsdir='cd /home/tkimmel/.steam/steam/steamapps/compatdata/275850/pfx/drive_c/users/steamuser/AppData/Roaming/HelloGames/NMS/st_76561198029442146'
alias protondir='cd /home/tkimmel/.steam/root/compatibilitytools.d/'
alias wardir='cd /home/tkimmel/Documents/RPG/Warhammer40k/'
alias aosdir='cd /home/tkimmel/Documents/RPG/WarhammerAgeOfSigmar/'

# SSH Aliases
alias pil='ssh 192.168.1.111'
alias piw='ssh kimmelpi.us.to'

# Vim
alias vimv='vim -O' # Open files in verticle split
alias vimh='vim -o' # Open files in horizontal split
alias vimt='vim -p' # Open files in tabs
alias vimr='vim -R' # Open file in read-only

alias python='python2' # Make the default python command use python2 rather than python3
alias py='python3'
alias naut='nautilus . > /dev/null & disown & exit'
alias fehbg='feh --bg-scale'
alias mntfantom='sudo mount /dev/sdc1 /mnt/Fantom'
alias update3d='rsync -avh --delete --update /mnt/storage/3DPrint/ /mnt/Fantom/3DPrint'
alias updaterpg='rsync -avh --delete --update /mnt/storage/RPG/ /mnt/Fantom/RPG'
