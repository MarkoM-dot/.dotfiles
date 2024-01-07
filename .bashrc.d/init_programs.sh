export PATH="$PATH:$HOME/.cargo/bin"
export FLYCTL_INSTALL="/home/markom-dot/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

if [ -x "$(command -v nvim)" ]; then
    export EDITOR="nvim"
fi

eval "$(starship init bash)"
