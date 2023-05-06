# Machine Configuration
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
    ├─ bin/             build scripts
    ├─ roles/           tasks and related artifacts used by ansible-playbook
    
### Tools

- bash
- neovim
- cargo
- node
