# Machine Configuration
![CI](https://github.com/MarkoM-dot/.dotfiles/actions/workflows/build.yml/badge.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/MarkoM-dot/.dotfiles)
![Last commit](https://img.shields.io/github/last-commit/MarkoM-dot/.dotfiles?color=orange)

### Disclaimer
This is my personal configuration and you may run the installation script at your own risk.

### Ansible

Ansible is responsible for downloading, updating, and maintaining my chosen configuration files.

### Stow

This repository uses stow to create symbolic links for all relevant configuration files or folders.
If you wish to remove the symbolic links created by stow, execute the following command in your ~/.dotfiles dir:

```bash
stow -D .
```

### Project Layout


    ├─ .config/         configuration settings
    ├─ .github/         build automation
    ├─ bin/             build scripts
    ├─ roles/           tasks and related artifacts used by ansible-playbook
    └─ tests/           test suite
    
### Tools

- bash
- neovim
- synth-shell
- pyenv
- poetry
- cargo

### Tested on:
- [x] Ubuntu 22.04
- [x] WSL running Ubuntu 22.04
- [x] Pop!_OS
- [ ] Kali
