#!/bin/bash
SCRIPT="$0"
ES_HOME=`dirname "$SCRIPT"`/..
ES_HOME=`cd "$ES_HOME"; pwd`
cd $ES_HOME

ES_JDBC_HOME=`cd "elasticsearch-jdbc-1.7.1.0"; pwd`


#copy es jdbc script
cp -r deploy/es-jdbc/* $ES_JDBC_HOME/bin
