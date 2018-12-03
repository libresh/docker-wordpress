ARG VERSION=fpm
FROM wordpress:$VERSION
COPY run.sh /run.sh
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini
CMD ["/run.sh"]
