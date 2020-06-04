FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py


#configure apache2
RUN  a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2","-D", "FOREGROUND"]
