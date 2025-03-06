nvim_path=$( command -v nvim )

if [ -n "$nvim_path" ]; then
    alias nv='$nvim_path'
fi
alias k='kubectl'
alias activate='deactivate &> /dev/null; source ./.venv/bin/activate'
alias python='python3'
