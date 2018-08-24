FROM ibmcom/informix-developer-database
LABEL Description="Servidor Ubuntu 18 con PHP 7.2, Infomix, Apache 2.4 y Speed Page para apache." \
	License="Apache License 2.0" \
	Usage="docker run -d -p [HOST WWW PORT NUMBER]:80 -p  -v [HOST WWW DOCUMENT ROOT]:/var/www/html  andres3191/php:7.2-apache-informix" \
	Version="1.0"
USER root
RUN sudo rm /var/lib/apt/lists/lock
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y tzdata
RUN sudo apt-get install git nodejs npm composer nano tree vim curl ftp -y
ENV TZ=America/Bogota
ENV LICENSE=accept
RUN sudo apt-get -y install apache2
RUN sudo apt-get install -y libapache2-mod-php
RUN sudo apt-get install -y \
        php \
        php-bz2 \
        php-cgi \
        php-cli \
        php-common \
        php-curl \
        php-dev \
        php-enchant \
        php-fpm \
        php-gd \
        php-gmp \
        php-imap \
        php-interbase \
        php-intl \
        php-json \
        php-ldap \
        php-mbstring \
        php-mysql \
        php-odbc \
        php-opcache \
        php-pgsql \
        php-phpdbg \
        php-pspell \
        php-readline \
        php-recode \
        php-soap \
        php-snmp \
        php-sqlite3 \
        php-sybase \
        php-tidy \
        php-xmlrpc \
        php-xsl \
        php-zip

RUN sudo apt-get update && sudo apt-get -y upgrade

VOLUME /var/www/html

COPY  index.php /var/www/html
COPY  test.php /var/www/html

ENV INFORMIXDIR /opt/ibm/informix
ENV PATH $INFORMIXDIR/bin:$PATH
#Install PDO_Informix
COPY scripts/PDO_INFORMIX-1.3.3.tgz /tmp
COPY scripts/install-informixpdo.sh /tmp
RUN sudo ln -s /usr/include/php/20170718/ext /usr/include/php/ext
RUN sudo sh -c /tmp/install-informixpdo.sh
#Install APC
COPY scripts/APC-3.1.13.tgz /tmp
COPY scripts/install-apc.sh /tmp
RUN sudo sh -c /tmp/install-apc.sh
#Informix environment variables for Apache
COPY scripts/envvars.sh /tmp
RUN chmod +x /tmp/envvars.sh
RUN sudo sh -c /tmp/envvars.sh
RUN sudo sh /tmp/envvars.sh
CMD ["/tmp/envvars.sh"]
RUN sudo sh -c "echo 'extension=pdo_informix.so' >> /etc/php/7.2/apache2/conf.d/pdo_informix.ini"
RUN sudo sh -c "echo 'extension=pdo_informix.so' >> /etc/php/7.2/cli/conf.d/pdo_informix.ini"
RUN sudo sh -c "echo 'sqlexec  9088/tcp\nsqlexec-ssl  9089/tcp' >> /etc/services"
#Instalar Speed Page
RUN cd /tmp \
    && curl -o /tmp/mod-pagespeed.deb https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb \
    && dpkg -i /tmp/mod-pagespeed.deb \
    && apt-get -f install
#Inicializa apache2
RUN a2enmod rewrite

COPY run-lamp.sh /usr/sbin/
RUN chmod +x /usr/sbin/run-lamp.sh
RUN chown -R www-data:www-data /var/www/html
CMD ["/usr/sbin/run-lamp.sh"]
RUN sudo sh -c "echo 'sudo service apache2 start' >> /etc/bash.bashrc"
EXPOSE 80
