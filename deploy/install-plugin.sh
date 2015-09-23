#!/bin/bash
SCRIPT="$0"
ES_HOME=`dirname "$SCRIPT"`/..
ES_HOME=`cd "$ES_HOME"; pwd`
cd $ES_HOME

# download jdbc plugin
wget http://xbib.org/repository/org/xbib/elasticsearch/importer/elasticsearch-jdbc/1.7.1.0/elasticsearch-jdbc-1.7.1.0-dist.zip
unzip elasticsearch-jdbc-1.7.1.0-dist.zip

# install smartcn plugin
bin/plugin install elasticsearch/elasticsearch-analysis-smartcn/2.7.0


# get the pid of elasticsearch
getpidOfES(){
  getprocess=`ps -ef|grep elasticsearch`
  echo $getprocess
  set $getprocess 
  pid=$2
  echo "the pid of elasticsearch:$pid"
  return $pid
}

# restart elasticsearch
# shutdown elasticsearch
echo "prepare to restart elasticsearch!"
echo "get the process of elasticsearch:"
getpidOfES
pid=$?
kill -9 $pid
echo "stoped the elasticsearch"

#start elasticsearch 
echo "start the elasticsearch"
echo "`sh ./bin/elasticsearch -d`"
getpidOfES
