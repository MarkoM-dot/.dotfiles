# Machine Configuration
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/MarkoM-dot/.dotfiles)
![Last commit](https://img.shields.io/github/last-commit/MarkoM-dot/.dotfiles?color=orange)

## Disclaimer!
This is my personal configuration and you may run the installation script at your
own risk.

Docker is used to simulate the automated configuration on a new machine for testing
purposes. Unfortunately, installing rust tools is *very* slow but required by neovim.

## What is this place?

The goal of this repository is to automate the configuration of my machines with
the following simple command `dotfiles`. On a fresh install, the repo should
be cloned and the script in the bin folder can be executed to configure the
environment. Rerunning the script again will update the configuration keeping
packages on their latest release. Fedora is the preferred Linux distribution and
more options will be added if I feel the need to distro-hop. Furthermore,
adjustments to configurations can now happen in a single repository as opposed
to configuring each individual machine.

Ansible is responsible for downloading, updating, and maintaining my chosen
configuration files.

This repository uses stow to create symbolic links for all relevant configuration
files or folders. If you wish to remove the symbolic links created by stow,
execute the following command in your ~/.dotfiles directory:

```bash
stow -D .
```

## Project Layout


    ├─ .config/         configuration settings
    ├─ bin/             build scripts
    ├─ roles/           tasks and related artifacts used by ansible-playbook

## Testing

```sh
docker build -f Dockerfile.Alpine -t alpine-dotfiles .
docker run -it alpine-dotfiles
```

## What now?

The script works on Fedora! If another distro tickles my fancy I'll make the
necessary adjustments.
