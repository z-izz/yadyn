#!/bin/bash

# make sure we are sudo
sudo echo "Building deb..."

echo "Creating directories..."
# make directories
mkdir yadyn
mkdir yadyn/DEBIAN
mkdir yadyn/usr
mkdir yadyn/usr/bin
mkdir yadyn/usr/share
mkdir yadyn/usr/share/yadyn

echo "Creating DEBIAN/control file..."
cat <<EOF > yadyn/DEBIAN/control
Package: yadyn
Version: 1.1.0
Section: utils
Priority: optional
Architecture: all
Depends: ruby, zenity
Maintainer: z-izz <dev@gordae.com>
Description: Dynamic wallpaper manager for Linux
Homepage: https://github.com/z-izz/yadyn/
EOF

echo "Adding the runner file..."
# add the runner file
cp runner.sh yadyn/usr/bin/yadyn

echo "Adding the ruby files..."
# add the ruby files
cp *.rb yadyn/usr/share/yadyn

echo "Changing permissions for the deb..."
# give root permissions to the dir
sudo chown -R root:root yadyn
sudo chmod 0755 yadyn/DEBIAN
sudo chmod 0755 yadyn/usr/bin/*
sudo chmod 0755 yadyn/usr/share/yadyn*

echo "Packing deb..."
# build the deb
sudo dpkg-deb --build yadyn
