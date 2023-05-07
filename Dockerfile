FROM fedora:latest

RUN useradd markom-dot && \
    usermod -aG wheel markom-dot && \
    echo 'markom-dot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER markom-dot

WORKDIR /home/markom-dot/.dotfiles

COPY . .

RUN ./bin/dotfiles | tee /tmp/dotfiles_log
