## -*- docker-image-name: "scaleway/debian:wheezy" -*-
FROM multiarch/debian-debootstrap:amd64-wheezy
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM multiarch/debian-debootstrap:armhf-wheezy    # arch=armv7l
#FROM multiarch/debian-debootstrap:arm64-wheezy    # arch=arm64
#FROM multiarch/debian-debootstrap:i386-wheezy     # arch=i386
#FROM multiarch/debian-debootstrap:powerpc-wheezy  # arch=powerpc
#FROM multiarch/debian-debootstrap:armel-wheezy    # arch=armel
#FROM multiarch/debian-debootstrap:mips-wheezy     # arch=mips


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Environment
ENV DEBIAN_FRONTEND=noninteractive SCW_BASE_IMAGE=scaleway/debian:wheezy


# Configure aptitude
# Note that, `${ARCH}` is set in the multiarch/debian-debootstrap image
COPY ./overlay-${ARCH}/etc/apt/ /etc/apt/


# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/
RUN /bin/sh -xe /usr/local/sbin/scw-builder-enter


# Install packages
RUN apt-get -q update && \
    apt-get -y -qq upgrade && \
    apt-get install -y -qq \
	bash-completion \
	bc \
	bootlogd \
	ca-certificates \
	cron \
	curl \
	dbus \
	dstat \
	ethstatus \
	file \
	fio \
	haveged \
	htop \
	ioping \
	iotop \
	iperf \
	iptables \
	iputils-ping \
	isc-dhcp-client \
	kmod \
	less \
	libnss-myhostname \
	locales \
	locate \
	lsb-release \
	lsof \
	make \
	man-db \
	mg \
	mosh \
	nano \
	net-tools \
	netcat \
	ntp \
	ntpdate \
	python-apt \
	python-yaml \
	rsync \
	rsyslog \
	screen \
	shunit2 \
	socat \
	ssh \
	sudo \
	sysstat \
	tcpdump \
	tmux \
	vim \
	wget \
	whiptail \
    unattended-upgrades \
    && apt-get clean


# update-motd.d
RUN rm -f /etc/motd && ln -s /var/run/motd /etc/motd


# Patch rootfs
COPY ./overlay/ ./overlay-image-tools/ ./overlay-${ARCH}/ /


# Configure locales
RUN locale-gen


# Configure SysV
RUN update-rc.d scw-ssh-keys defaults && \
    update-rc.d scw-force-dhclient defaults && \
    update-rc.d scw-sync-kernel-modules defaults


# Fix permissions
RUN chmod 755 /etc/default


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
