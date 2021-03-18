FROM golang:1.15

ARG GITHUB_ACCESS_TOKEN

RUN apt-get update && apt-get install -y vim zsh

RUN apt-get install openssh-server -y
RUN mkdir /var/run/sshd
RUN echo 'root:pw' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd



ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22