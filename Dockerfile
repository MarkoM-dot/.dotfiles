FROM fedora:latest

WORKDIR $HOME/.dotfiles

RUN dnf update -y

COPY . .

RUN ./bin/dotfiles | tee /tmp/dotfiles_log
