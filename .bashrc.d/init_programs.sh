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

export PATH="$PATH:$HOME/.cargo/bin:$HOME/.dotfiles/bin:$HOME/.local/share/pnpm:$HOME/.fly/bin"

[ -x "$(command -v nvim)" ] && export EDITOR="nvim"

[ -f "$HOME/.bashrc.d/extras.sh" ] && source "$HOME/.bashrc.d/extras.sh"

[ -f "$HOME/.elan/env" ] && source "$HOME/.elan/env"

eval "$(starship init bash)"
