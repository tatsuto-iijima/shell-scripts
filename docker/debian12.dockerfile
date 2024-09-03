FROM debian:12
RUN apt update
RUN apt install -y curl git
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes
RUN ln -s /root/.local/lib/shellspec/shellspec /usr/local/bin/
# ShellSpec testing requires the commands ”watch"
RUN apt install -y procps