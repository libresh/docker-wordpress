FROM wordpress:fpm
COPY run.sh /run.sh
CMD ["/run.sh"]
