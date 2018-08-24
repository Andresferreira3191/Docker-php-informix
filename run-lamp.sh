#!/bin/bash

function exportBoolean {
    if [ "${!1}" = "**Boolean**" ]; then
            export ${1}=''
    else 
            export ${1}='Yes.'
    fi
}

exportBoolean LOG_STDOUT
exportBoolean LOG_STDERR

if [ $LOG_STDERR ]; then
    /bin/ln -sf /dev/stderr /var/log/apache2/error.log
else
	LOG_STDERR='No.'
fi

if [ $ALLOW_OVERRIDE == 'All' ]; then
    /bin/sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
fi

if [ $LOG_LEVEL != 'warn' ]; then
    /bin/sed -i "s/LogLevel\ warn/LogLevel\ ${LOG_LEVEL}/g" /etc/apache2/apache2.conf
fi
/bin/sed -i 's/ServerTokens\ Full/ServerTokens\ Prod/g' /etc/apache2/conf-enabled/security.conf
/bin/sed -i 's/ServerTokens\ Major/ServerTokens\ Prod/g' /etc/apache2/conf-enabled/security.conf
/bin/sed -i 's/ServerTokens\ Minor/ServerTokens\ Prod/g' /etc/apache2/conf-enabled/security.conf
/bin/sed -i 's/ServerTokens\ Min/ServerTokens\ Prod/g' /etc/apache2/conf-enabled/security.conf
/bin/sed -i 's/ServerTokens\ Minimal/ServerTokens\ Prod/g' /etc/apache2/conf-enabled/security.conf
/bin/sed -i 's/ServerSignature\ On/ServerSignature\ Off/g' /etc/apache2/conf-enabled/security.conf

# Run Apache:
if [ $LOG_LEVEL == 'debug' ]; then
    /usr/sbin/apachectl -DFOREGROUND -k start -e debug
else
    &>/dev/null /usr/sbin/apachectl -DFOREGROUND -k start
fi