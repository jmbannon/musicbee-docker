from ghcr.io/linuxserver/webtop:ubuntu-xfce-version-79d8af51

COPY root/ /
RUN echo "Beginning build" && \
    # Add Wine repo
    cat /etc/os-release && \
    # Install packages
    sudo apt-get update && \
    sudo apt-get install -y wget git vim nano && \
    sudo dpkg --add-architecture i386 && \
    sudo mkdir -pm755 /etc/apt/keyrings && \
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && \
    sudo apt-get update && \
    sudo apt-get install --install-recommends -y winehq-stable

VOLUME /config
