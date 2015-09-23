#!/bin/bash
INSTALL_DIR="/home/andy/work/"
if [ -z "$1" ]
 then
  echo "no arguments, use the default install dir"
else
 INSTALL_DIR=$1
 echo "install dir is $1"
fi

echo "current dir is :`pwd`,change to install dir:$INSTALL_DIR"
cd $INSTALL_DIR

#wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.tar.gz
curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.tar.gz
tar -xvf elasticsearch-1.7.1.tar.gz
ln -s elasticsearch-1.7.1 elasticsearch

rm elasticsearch-1.7.1.tar.gz

cd elasticsearch
ES_HOME=`pwd`
cd $ES_HOME/bin
echo `pwd`
