FROM golang:1.15

ARG GITHUB_ACCESS_TOKEN

RUN apt-get update && apt-get install -y vim zsh

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run zsh on container start
CMD ["zsh"]
