from linuxserver/webtop:arch-xfce-version-2023-01-27

RUN echo "Beginning build" && \
    # Add multilib
    su -c "echo \"\" >> /etc/pacman.conf" && \
    su -c "echo \"[multilib]\" >> /etc/pacman.conf" && \
    su -c "echo \"Include = /etc/pacman.d/mirrorlist\" >> /etc/pacman.conf" && \
    pacman -Syu --noconfirm && \

    # Install packages
    pacman -S --noconfirm git vim nano wine winetricks lib32-libpulse wine-mono p7zip && \

    # Create tmp build dir
    mkdir /install && \
    chown abc:abc /install && \
    cd /install && \

    # Build musicbee in it
    su abc -c "git clone \"https://aur.archlinux.org/musicbee.git\"" && \
    cd musicbee && \
    su abc -c "makepkg"

VOLUME /config
