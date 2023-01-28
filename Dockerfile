from linuxserver/webtop:arch-xfce-version-2023-01-27

COPY root/ /
RUN echo "Beginning build" && \
    # Add multilib
    su -c "echo \"\" >> /etc/pacman.conf" && \
    su -c "echo \"[multilib]\" >> /etc/pacman.conf" && \
    su -c "echo \"Include = /etc/pacman.d/mirrorlist\" >> /etc/pacman.conf" && \
    pacman -Syu --noconfirm && \
    # Install packages
    pacman -S --noconfirm git vim nano wine winetricks lib32-libpulse wine-mono p7zip && \
    # Install Segoe font (default MusicBee font)
    git clone https://aur.archlinux.org/ttf-segoe-ui-variable.git && \
    sudo chown abc:abc /config && \
    ls -lh && \
    pwd && \
    sudo chown abc:abc /ttf-segoe-ui-variable && \
    su - abc -c "cd /ttf-segoe-ui-variable && makepkg --install --noconfirm" && \
    rm -rf /tff-segoe-ui-variable

VOLUME /config
