FROM tutum/lamp

RUN apt-get install -y curl && \
    rm /var/www/html && \
    git clone -b v4.0-rc.1 https://github.com/thebuggenie/thebuggenie /efesto/buggenie

ENV MYSQL_PASS MYPASS
RUN ln -s /efesto/buggenie/thebuggenie /var/www/html

WORKDIR /efesto/buggenie

RUN curl -sS https://getcomposer.org/installer | php

RUN apt-get -y update && \
    apt-get -y install php5-gd php5-curl

RUN php composer.phar install

ADD .htaccess /efesto/buggenie/thebuggenie/.htaccess
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh

RUN mkdir /efesto/buggenie/cache/ && \
    chmod a+w -R /efesto && \
    touch /efesto/buggenie/core/config/b2db.yml && \
    chmod a+w /efesto/buggenie/core/config/b2db.yml && \
    chmod a+w /create_mysql_admin_user.sh

EXPOSE 80 3306

CMD ["/run.sh"]
