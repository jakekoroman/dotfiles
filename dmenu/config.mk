# dmenu version
VERSION = 5.2

# paths
PREFIX = ~/.local
MANPREFIX = $(PREFIX)/share/man

PKG_CONFIG=pkg-config

INCS = `$(PKG_CONFIG) --cflags x11` \
       `$(PKG_CONFIG) --cflags xinerama` \
       `$(PKG_CONFIG) --cflags xext` \
       `$(PKG_CONFIG) --cflags freetype2`

LIBS = `$(PKG_CONFIG) --libs x11` \
       `$(PKG_CONFIG) --libs xinerama` \
       `$(PKG_CONFIG) --libs xft` \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\"
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS) -lm

# compiler and linker
CC = gcc
