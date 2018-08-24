#!/bin/bash
echo "INFORMIXDIR=/opt/ibm/informix" >> /etc/apache2/envvars
echo "export INFORMIXDIR" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "DB_LOCALE=es_es.8859-1" >> /etc/apache2/envvars
echo "export DB_LOCALE" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "LD_LIBRARY_PATH=/opt/ibm/informix/lib:/opt/ibm/informix/lib/esql:/opt/ibm/informix/lib:/opt/ibm/informix/lib/esql:" >> /etc/apache2/envvars
echo "export LD_LIBRARY_PATH" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "TZ=America/Bogota" >> /etc/apache2/envvars
echo "export TZ" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "SCRIPTS=/opt/ibm/scripts" >> /etc/apache2/envvars
echo "export SCRIPTS" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "INFORMIXSERVER=informix" >> /etc/apache2/envvars
echo "export INFORMIXSERVER" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "INFORMIX_DATA_DIR=/opt/ibm/data" >> /etc/apache2/envvars
echo "export INFORMIX_DATA_DIR" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "LICENSE=accet" >> /etc/apache2/envvars
echo "export LICENSE" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "INFORMIXSQLHOSTS=/opt/ibm/informix/etc/sqlhosts" >> /etc/apache2/envvars
echo "export INFORMIXSQLHOSTS" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "IBMDIR=/opt/ibm" >> /etc/apache2/envvars
echo "export IBMDIR" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "INFORMIX_HOME=/home/informix" >> /etc/apache2/envvars
echo "export INFORMIX_HOME" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars
echo "PATH=:/opt/ibm/informix/bin:.::/opt/ibm/informix/bin:.:/opt/ibm/informix/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/apache2/envvars
echo "export PATH" >> /etc/apache2/envvars
echo "" >> /etc/apache2/envvars