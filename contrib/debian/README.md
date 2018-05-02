
Debian
====================
This directory contains files used to package lukd/luk-qt
for Debian-based Linux systems. If you compile lukd/luk-qt yourself, there are some useful files here.

## luk: URI support ##


luk-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install luk-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your luk-qt binary to `/usr/bin`
and the `../../share/pixmaps/luk128.png` to `/usr/share/pixmaps`

luk-qt.protocol (KDE)

