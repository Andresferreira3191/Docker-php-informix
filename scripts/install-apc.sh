HOSTNAME=0.0.0.0    # Where this file is located
PECL_DIRECTORY=APC-3.1.13
PECL_FILENAME=$PECL_DIRECTORY.tgz

TMPDIR=/tmp

tar  -xvf $TMPDIR/$PECL_FILENAME  -C $TMPDIR/
cd  $TMPDIR/$PECL_DIRECTORY
phpize  &&  ./configure -with-php-config=/usr/bin/php-config && make  &&  make install

rm -r $TMPDIR/*

