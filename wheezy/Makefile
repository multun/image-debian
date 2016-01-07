NAME =			debian
VERSION =		wheezy
VERSION_ALIASES =	7.9 7
TITLE =			Debian Wheezy
DESCRIPTION =		Debian Wheezy
SOURCE_URL =		https://github.com/scaleway/image-debian
VENDOR_URL =		https://www.debian.org
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_NAME =		Debian Wheezy (7.9)
IMAGE_BOOTSCRIPT =	stable
IMAGE_VOLUME_SIZE =	50G

# This is specific to distribution images
# -- to fetch latest code, run 'make sync-image-tools'
IMAGE_TOOLS_FLAVORS =   docker-based,common,sysvinit,feature-motd
IMAGE_TOOLS_CHECKOUT =  23f3212bd114db1a3ad60c57c42388fb0c23392c


## Image tools  (https://github.com/scaleway/image-tools)
all:    ../docker-rules.mk
../docker-rules.mk:
	$(MAKE) -C .. docker-rules.mk
-include ../docker-rules.mk
