FROM ubuntu:jammy

WORKDIR $HOME/.dotfiles

RUN apt update && apt install sudo

COPY . .

RUN ./bin/dotfiles | tee /tmp/dotfiles_log
