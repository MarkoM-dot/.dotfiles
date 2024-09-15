if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

export PATH="$PATH:$HOME/.cargo/bin"
export FLYCTL_INSTALL="/home/markom-dot/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PNPM_HOME="/home/markom-dot/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

if [ -x "$(command -v nvim)" ]; then
    export EDITOR="nvim"
fi

eval "$(starship init bash)"
