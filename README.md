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

If you have docker installed you may see what the environment looks like with
the following two commands.

```sh
# substitute fedora for ubuntu if needed
docker build -f Dockerfile.Fedora -t fedora-dotfiles .
docker run --rm -it fedora-dotfiles
```

## What now?

This automation works on Fedora, Ubuntu, and Macbook Pro M3! If another distro tickles
my fancy I'll make the necessary adjustments.

## MacOS

Associative arrays appeared in Bash version 4. Use homebrew to install the
latest Bash version and set it as your default shell. Apple Silicon machines
have an older version of Bash and so the script will not work; upgrading to a
newer Bash version is preferable either way.

## Upgrading Neovim

Remove neovim related folders:

```sh
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# find the executable and remove it
type nvim
rm /usr/local/bin/nvim
```

Now update the version number in the neovim ansible task.

