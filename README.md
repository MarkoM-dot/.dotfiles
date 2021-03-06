# Machine Configuration
![CI](https://github.com/MarkoM-dot/.dotfiles/actions/workflows/build.yml/badge.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/MarkoM-dot/.dotfiles)
![Last commit](https://img.shields.io/github/last-commit/MarkoM-dot/.dotfiles?color=orange)

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
