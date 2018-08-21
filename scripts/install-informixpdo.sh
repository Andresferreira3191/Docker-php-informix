HOSTNAME=0.0.0.0    # Where this file is located
PDO_DIRECTORY=PDO_INFORMIX-1.3.3
PDO_FILENAME=$PDO_DIRECTORY.tgz
export INFORMIXDIR=/opt/ibm/informix
TMPDIR=/tmp

tar  -xvf $TMPDIR/$PDO_FILENAME  -C $TMPDIR/
cd  $TMPDIR/$PDO_DIRECTORY
phpize  &&  ./configure -with-php-config=/usr/bin/php-config && make  &&  make install

rm -r $TMPDIR/*

