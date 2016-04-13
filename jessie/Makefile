NAME =			debian
VERSION =		jessie
VERSION_ALIASES =	8.2 8 latest
TITLE =			Debian Jessie
DESCRIPTION =		Debian Jessie
SOURCE_URL =		https://github.com/scaleway/image-debian
VENDOR_URL =		https://www.debian.org
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_NAME =		Debian Jessie (8.2 latest)
IMAGE_BOOTSCRIPT =	latest
IMAGE_VOLUME_SIZE =	50G

# This is specific to distribution images
# -- to fetch latest code, run 'make sync-image-tools'
IMAGE_TOOLS_FLAVORS =   common,docker-based,systemd,feature-motd
IMAGE_TOOLS_CHECKOUT =  276916c5288895ab02e753e138f3701c94141f64


## Image tools  (https://github.com/scaleway/image-tools)
all:    ../docker-rules.mk
../docker-rules.mk:
	$(MAKE) -C .. docker-rules.mk
-include ../docker-rules.mk
