set EDITOR "$(which nvim)"

if test -f $HOME/venv/bin/activate.fish
    source $HOME/venv/bin/activate.fish
else if test -f $HOME/.venv/bin/activate.fish
    source $HOME/.venv/bin/activate.fish
end

alias v 'nvim'
alias vl 'nvim leetcode.nvim'
alias g 'git'
alias gc 'git clone'
alias cc 'git commit -m'
alias gs 'git status'
alias ga 'git add'
alias gp 'git push'
alias gd 'git diff'

# brew
alias bi 'brew install'
alias bu 'brew update'
alias bs 'brew search'
alias bd 'brew doctor'
alias bl 'brew list'
alias br 'brew reinstall'

alias jumpcloud "echo passwd | totp-cli g --show-remaining cashfree jumpcloud | cut -d ' ' -f 1 | tr -d '\n' | pbcopy"
alias vpn "echo passwd | totp-cli g --show-remaining cashfree vpn | cut -d ' ' -f 1 | tr -d '\n' | pbcopy"
alias cashfree "echo passwd | totp-cli g --show-remaining cashfree $argv[1] | cut -d ' ' -f 1 | tr -d '\n' | pbcopy"
alias k "kubectl --insecure-skip-tls-verify "

# uv
fish_add_path "/Users/harsha/.local/bin"

alias claude="/Users/harsha/.claude/local/claude"

# nvm - ensure it's available in all sessions including tmux
if test -d ~/.local/share/nvm
    set -gx NVM_DIR ~/.local/share/nvm
    nvm use lts --silent
end


