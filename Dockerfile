FROM ibmcom/informix-developer-database
USER root
RUN sudo rm /var/lib/apt/lists/lock
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y tzdata
RUN sudo apt-get install git nodejs npm composer nano tree vim curl ftp -y
ENV TZ=America/Bogota
ENV LICENSE=accept
RUN sudo apt-get -y install apache2
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
RUN sudo apt-get install -y libapache2-mod-php
RUN sudo apt-get update && sudo apt-get -y upgrade

VOLUME /var/www/html

COPY  index.php /var/www/html

ENV INFORMIXDIR /opt/ibm/informix
ENV PATH $INFORMIXDIR/bin:$PATH

COPY scripts/PDO_INFORMIX-1.3.3.tgz /tmp
COPY scripts/install-informixpdo.sh /tmp
RUN sudo ln -s /usr/include/php/20170718/ext /usr/include/php/ext
RUN sudo sh /tmp/install-informixpdo.sh


CMD rm -r $TMPDIR/*
#Informix environment variables for Apache
COPY scripts/envvars.sh /tmp
RUN sudo sh /tmp/envvars.sh
RUN echo "extension=pdo_informix.so" >> /etc/php/7.2/apache2/conf.d/pdo_informix.ini
RUN echo "extension=pdo_informix.so" >> /etc/php/7.2/cli/conf.d/pdo_informix.ini
RUN sudo echo "sqlexec  9088/tcp\nsqlexec-ssl  9089/tcp" >> /etc/services

EXPOSE 80
