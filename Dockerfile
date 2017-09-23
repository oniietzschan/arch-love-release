FROM base/archlinux:latest

RUN pacman -Syy && \
  # Install love-release
  yes | pacman -S \
    gcc \
    git \
    libzip \
    luarocks5.1 && \
  luarocks-5.1 install --server=http://luarocks.org/dev lua-zip && \
  luarocks-5.1 install love-release && \
  luarocks-5.1 install loverocks && \
  # Install additional Lua libraries
  luarocks-5.1 install bump && \
  luarocks-5.1 install bump-3dpd && \
  luarocks-5.1 install middleclass && \
  luarocks-5.1 install moses && \
  luarocks-5.1 install serpent && \
  # Install itch.io butler
  mkdir ~/bin && \
  curl https://dl.itch.ovh/butler/linux-amd64/head/butler --output ~/bin/butler && \
  chmod 755 ~/bin/butler

ENV PATH="$PATH:~/bin"
