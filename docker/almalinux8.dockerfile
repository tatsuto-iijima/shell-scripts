FROM almalinux:8
RUN dnf install -y git
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes
RUN ln -s /root/.local/lib/shellspec/shellspec /usr/local/bin/
# ShellSpec testing requires the commands ”watch"
RUN dnf install -y procps-ng