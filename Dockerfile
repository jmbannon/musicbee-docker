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
    # Install Selawik font
    git clone https://aur.archlinux.org/ttf-selawik.git && \
    sudo chown abc:abc /config && \
    sudo chown abc:abc /ttf-selawik && \
    su - abc -c "cd /ttf-selawik && makepkg --install --noconfirm" && \
    rm -rf /tff-selawik

VOLUME /config
