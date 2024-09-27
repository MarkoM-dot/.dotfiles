nvim_path=$( command -v nvim )

if [ -n "$nvim_path" ]; then
    alias nv='/usr/bin/nvim'
fi
alias dotfiles='~/.dotfiles/bin/dotfiles'
alias k='kubectl'
alias activate='deactivate &> /dev/null; source ./.venv/bin/activate'
alias python='python3'
