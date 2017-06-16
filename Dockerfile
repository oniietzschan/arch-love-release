FROM base/archlinux:latest

RUN pacman -Syy && \
  yes | pacman -S \
    gcc \
    git \
    libzip \
    luarocks5.1 && \
  luarocks-5.1 install --server=http://luarocks.org/dev lua-zip && \
  luarocks-5.1 install love-release
