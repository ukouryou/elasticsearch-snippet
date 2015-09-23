#!/bin/sh
SCRIPT="$0"
ES_JDBC_HOME=`dirname "$SCRIPT"`/..
ES_JDBC_HOME=`cd "$ES_JDBC_HOME"; pwd`
bin=${ES_JDBC_HOME}/bin
lib=${ES_JDBC_HOME}/lib
echo '{
    "type" : "jdbc",
    "jdbc" : {
	"schedule" : "0 0/2 * * * ?",
        "url" : "jdbc:postgresql://192.168.5.100:5432/courses?loglevel=0",
        "user" : "lrs",
        "password" : "123456",
	"statefile" : "project-statefile.json",
        "sql" : [
	  {
		"statement":"SELECT id as _id, name, description, status, logo, authors, category as tag, stored, repository, owner, type FROM project WHERE type='"'"'project'"'"' AND stored > ?",
		"parameter" : [ "$metrics.lastexecutionstart" ]
	  }
	],
	"metrics" : {
            	"enabled" : true,
       		"lastexecutionend" : "2014-07-06T09:08:06.076Z",
      		"counter" : "1",
     		"lastexecutionstart" : "2014-07-06T09:08:00.948Z"
   	 },
	"index" : "project",
	"type" : "projectmeta"
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter
