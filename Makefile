VERSIONS ?=	wheezy jessie sid
PROXYFIED_COMMANDS ?=	\
	all \
	build \
	bump-image-tools \
	clean \
	image_on_local \
	image_on_s3 \
	image_on_store \
	info \
	install \
	install_on_disk \
	publish_on_s3 \
	publish_on_s3.sqsh \
	publish_on_s3.tar \
	publish_on_s3.tar.gz \
	publish_on_store \
	re \
	rebuild \
	release \
	run \
	shell \
	sync-image-tools \
	travis

all:	
	build

# Proxyfied Makefile commands
.PHONY: $(PROXYFIED_COMMANDS)
$(PROXYFIED_COMMANDS):
	for version in $(VERSIONS); do \
	    $(MAKE) -C $$version $@; \
	done


docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
