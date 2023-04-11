FROM ubuntu:jammy

WORKDIR /home/dev

COPY /bin ./bin

RUN apt update && apt install sudo
