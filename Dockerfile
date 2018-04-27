FROM base/archlinux:latest

RUN pacman -Syy && \
  # Install love-release
  yes | pacman -S \
    gcc \
    git \
    libzip \
    luarocks5.1 && \
  luarocks-5.1 install lua-libzip && \
  luarocks-5.1 install love-release && \
  luarocks-5.1 install loverocks && \
  # Install busted
  luarocks-5.1 install busted && \
  # Install itch.io butler
  mkdir ~/bin && \
  curl https://dl.itch.ovh/butler/linux-amd64/head/butler --output ~/bin/butler && \
  chmod 755 ~/bin/butler

ENV PATH="$PATH:~/bin"
