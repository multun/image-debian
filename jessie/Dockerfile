## -*- docker-image-name: "scaleway/debian:jessie" -*-
FROM armbuild/debian:jessie
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Environment
ENV DEBIAN_FRONTEND noninteractive
# Useful for image inheritance
ENV SCW_BASE_IMAGE scaleway/debian:jessie


# ./patches/usr/local/bin/ is where the builder downloads qemu-*-static binaries
ADD ./patches/usr/local/bin/ /usr/local/bin/


# ./patches/etc/apt/ contains source.list + apt.conf tuning
ADD ./patches/etc/apt/ /etc/apt/


# Patch rootfs for docker-based builds
RUN apt-get -y -q update \
 && apt-get -y -qq install bash curl lsb-release tar \
 && apt-get -y clean \
 && curl -Lq http://j.mp/scw-skeleton | FLAVORS=common,docker-based,systemd,feature-motd bash -e \
 && /usr/local/sbin/builder-enter


# Install packages
ADD ./patches/etc/apt/sources.list /etc/apt/sources.list
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
	htop \
	ioping \
	iotop \
	iperf \
	iptables \
	iputils-ping \
	isc-dhcp-client \
	less \
	libnss-myhostname \
	locales \
	locate \
	lsb-release \
	lsof \
	make \
	man-db \
	mg \
	module-init-tools \
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
	systemd-sysv \
	tcpdump \
	tmux \
	uuid-runtime \
	vim \
	wget \
	whiptail \
    && apt-get clean



# Default target
RUN systemctl set-default multi-user


# Enable update-motd.d support
RUN rm -f /etc/motd && ln -s /var/run/motd /etc/motd


# Patch rootfs
ADD ./patches/etc/ /etc


# Configure locales
RUN locale-gen


# Configure Systemd
RUN systemctl enable \
        oc-fetch-ssh-keys \
	oc-sync-kernel-modules \
	oc-generate-ssh-keys \
	oc-gen-machine-id \
	oc-kernel-check \
 && systemctl disable \
	systemd-modules-load.service \
	systemd-update-utmp-runlevel \
	proc-sys-fs-binfmt_misc.automount \
	kmod-static-nodes.service


RUN rm -f /sbin/init \
 && ln -sf ../lib/systemd/systemd /sbin/init


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
