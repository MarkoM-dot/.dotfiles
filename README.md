# Machine Configuration
![CI](https://github.com/MarkoM-dot/.dotfiles/actions/workflows/build.yml/badge.svg)

### Ansible

### Stow

This repository uses stow to create symbolic links for all relevant configuration files or folders.
If you wish to remove the symbolic links created by stow, execute the following command in your ~/.dotfiles dir:

```bash
stow -D .
```

### Project Layout


    ├─ bin/             build scripts
    ├─ .config/         configuration settings
    └─ .github/         build automation

### Tools

- bash
- neovim
- synth-shell
- pyenv
- poetry
- cargo
