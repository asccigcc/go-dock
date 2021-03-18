FROM golang:1.15

ARG GITHUB_ACCESS_TOKEN

RUN apt-get update && apt-get install -y vim zsh