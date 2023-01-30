# musicbee-docker
## Run MusicBee in Docker for browser usage

`musicbee-docker` installs an runs
[MusicBee](https://www.getmusicbee.com/)
via
[Wine](https://www.winehq.org/)
in a
[webtop container](https://docs.linuxserver.io/images/docker-webtop)
running
[Arch Linux](https://archlinux.org/),
and is accessible in browser using
[Guacamole](https://guacamole.apache.org/).

![image](https://user-images.githubusercontent.com/10107080/215308172-1c91aa40-b97a-4163-8716-fd333d07bda5.png)

## Installation
#### Requirements
- x86-64 host
  - ARM should be possible but needs the support added
- Decent CPU
- Docker Compose
- A smidge of Linux knowledge

#### Docker Compose
```yaml
services:
  musicbee:
    image: ghcr.io/jmbannon/musicbee-docker:3.4.8033-beta.3
    container_name: musicbee
    ports:
      - 3000:3000
    security_opt:
      - seccomp:unconfined # required
    shm_size: "2gb" # optional, but recommended
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - TITLE=MusicBee
    volumes:
      - <path/to/musicbee/config>:/config
      - <path/to/music>:/music # optional
    restart: unless-stopped
```

Once running, you can access MusicBee at
- http://yourhost:3000/

The app will auto-open by default. If you close it, you can reopen it by selecting `Applications -> Other -> MusicBee`.

#### Adding your Music Library 
Assuming you mounted to `/music`, Wine will configure the `Z:/` drive to point to `/`, or root. You should see your music in `Z:/music`.

## Issues and Work-Arounds
#### Changing Fonts
Changing Fonts within MusicBee doesn't work. You can work around this by closing MusicBee and modifying the settings file. This command will replace all fonts with `Selawik` (recommended).

```bash
sed -i 's/<FontFamily>\(.*\)<\/FontFamily>/<FontFamily>Selawik<\/FontFamily>/g' /config/MusicBee/AppData/MusicBee3Settings.ini
```
#### Updating MusicBee
Since this is relatively new, I haven't had to update yet. A proper solution will be implemented at a later time.

#### Known Issues
- Cannot drag-and-drop tabs
- Japanese characters do not display

