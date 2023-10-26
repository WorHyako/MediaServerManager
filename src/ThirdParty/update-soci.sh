#!/bin/sh

if [ -d soci ]; then
  echo "Soci directory was found."
else
  echo "Soci directory wasn't found."

  git clone https://github.com/SOCI/soci.git soci

  cd soci \
    || git checkout origin master \
    || git pull origin master \
    || return

fi

mkdir "soci-build"

cmake -S soci -B soci-build -DCMAKE_INSTALL_PREFIX=soci-install

cmake --build soci-build

cmake --install soci-build
