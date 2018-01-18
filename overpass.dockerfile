FROM osm/overpass-base

RUN git clone https://github.com/drolbr/Overpass-API.git
WORKDIR /Overpass-API
#Checkout latest version
RUN git checkout $(git describe --abbrev=0 --tags)

#Configure
WORKDIR /Overpass-API/src
RUN \
	autoscan && \
	aclocal-1.11 && \
	autoheader && \
	libtoolize && \
	automake-1.11 --add-missing && \
	autoconf

#Compile
RUN \
	./configure --enable-lz4 CXXFLAGS="-O2" --prefix="`pwd`" && \
	make -j $(nproc --all)


COPY vhost_apache.conf /etc/apache2/sites-available
RUN a2enmod ext_filter cgi
RUN a2dissite 000-default.conf
RUN a2ensite vhost_apache.conf

WORKDIR /

COPY *.sh /
RUN chmod 777 /*.sh

ADD www /www

RUN useradd overpass_api

CMD ["/run.sh"]

VOLUME "/rep_data"
EXPOSE 80