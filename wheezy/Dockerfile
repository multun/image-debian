## -*- docker-image-name: "scaleway/debian:wheezy" -*-
FROM armbuild/debian:wheezy
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

 	    	    
# Environment
ENV DEBIAN_FRONTEND noninteractive
# Useful for image inheritance
ENV SCW_BASE_IMAGE scaleway/debian:wheezy


# ./patches/usr/local/bin/ is where the builder downloads qemu-*-static binaries
ADD ./patches/usr/local/bin/ /usr/local/bin/


# ./patches/etc/apt/ contains source.list + apt.conf tuning
ADD ./patches/etc/apt/ /etc/apt/


# Patch rootfs for docker-based builds
RUN apt-get -y -q update \
 && apt-get -y -qq install bash curl lsb-release tar \
 && apt-get -y clean \
 && curl -Lq http://j.mp/scw-skeleton | FLAVORS=docker-based,common,sysvinit,feature-motd bash -e \
 && /usr/local/sbin/builder-enter


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
    && apt-get clean


# update-motd.d
RUN rm -f /etc/motd && ln -s /var/run/motd /etc/motd


# Patch rootfs
ADD ./patches/etc/ /etc/


# Configure locales
RUN locale-gen

# Configure SysV
RUN update-rc.d ssh-keys defaults && \
    update-rc.d oc-force-dhclient defaults && \
    update-rc.d sync-kernel-modules defaults


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
