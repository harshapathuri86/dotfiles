export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
# source /opt/intel/oneapi/setvars.sh

export PATH="$PATH:$HOME/.cargo/bin"
#export PATH="$PATH:$HOME/go/bin" # added to fish using
# set -Ux GOPATH $HOME/go
# fish_add_path $GOPATH/bin
export PATH="$PATH:$HOME/.local/bin/statusbar"

alias mkd="mkdir -pv"
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias ffmpeg="ffmpeg -hide_banner"

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"

alias em='emacsclient --tty'
#alias ema='emacsclient --create-frame --no-wait'
#alias lf='lfub'
alias g="git"
alias p="pacman"

alias rpall="sudo pacman -R $(pacman -Qtdq)"
# sudo pacman -R $(pacman -Qqs package_name)

# pyenv init - | source
zoxide init fish | source

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Start X at login
# https://wiki.archlinux.org/title/fish
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end

# status --is-interactive; and pyenv virtualenv-init - | source
# export MPD_HOST=$HOME/.config/mpd/socket
