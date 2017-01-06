FROM wordpress:fpm
COPY run.sh /run.sh
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/run.sh"]
