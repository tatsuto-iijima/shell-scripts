FROM debian:11
RUN apt update
RUN apt install -y curl git
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes
RUN ln -s /root/.local/lib/shellspec/shellspec /usr/local/bin/