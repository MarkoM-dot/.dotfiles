# Mac Silicon related homebrew config
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"

  if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
     source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

     for COMPLETION in "$HOMEBREW_PREFIX/etc/bash_completion.d/"*; do
         [[ -r "$COMPLETION" ]] && source "$COMPLETION"
     done
  fi
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
