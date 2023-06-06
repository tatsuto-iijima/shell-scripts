FROM amazonlinux:2023
RUN yum install -y git
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes
RUN ln -s /root/.local/lib/shellspec/shellspec /usr/local/bin/