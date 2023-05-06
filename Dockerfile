FROM fedora:latest

WORKDIR $HOME/.dotfiles

COPY . .

RUN ./bin/dotfiles | tee /tmp/dotfiles_log
