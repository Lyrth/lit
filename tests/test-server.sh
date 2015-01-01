#!/bin/sh

BASE=`pwd`/test-server
export LIT_CONFIG=$BASE/config
rm -rf $BASE
mkdir $BASE
echo "database: $BASE/db.git" > $LIT_CONFIG
echo "storage: git" >> $LIT_CONFIG

export LUVI_APP=`pwd`:
luvit auth creationix

for file in modules/creationix/*
do
  luvit add $file || exit -1
done

luvit serve
