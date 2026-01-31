FROM debian:latest
COPY vscode.sources  /etc/apt/sources.list.d/vscode.sources
RUN apt-get -qq update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install wget gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg  && \
    install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg && \
    rm -f microsoft.gpg && \
    apt-get -qq update && apt-get -qq -y install code
