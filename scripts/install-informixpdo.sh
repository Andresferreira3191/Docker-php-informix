PDO_DIRECTORY=PDO_INFORMIX-1.3.1
PDO_FILENAME=$PDO_DIRECTORY.tgz

TMPDIR=/tmp
tar  -xvf $TMPDIR/$PDO_FILENAME  -C $TMPDIR/
cd  $TMPDIR/$PDO_DIRECTORY
phpize  &&  ./configure  && make  &&  make install

rm -r $TMPDIR/*
