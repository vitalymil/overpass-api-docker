FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y apache2 vim

RUN apt-get install -y \
	autoconf \
	automake1.11 \
	expat \
	git \
	g++ \
	libtool \
	libexpat1-dev \
	make \
	zlib1g-dev \
	bzip2 \
	wget \
	liblz4-1 liblz4-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*