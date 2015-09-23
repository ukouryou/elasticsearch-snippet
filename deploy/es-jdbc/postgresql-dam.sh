#!/bin/sh
SCRIPT="$0"
ES_JDBC_HOME=`dirname "$SCRIPT"`/..
ES_JDBC_HOME=`cd "$ES_JDBC_HOME"; pwd`
bin=${ES_JDBC_HOME}/bin
lib=${ES_JDBC_HOME}/lib
echo $bin
echo $lib
echo '{
    "type" : "jdbc",
    "jdbc" : {
	"schedule" : "0 0/1 * * * ?",
        "url" : "jdbc:postgresql://192.168.5.100:5432/dam?loglevel=0",
        "user" : "dam",
        "password" : "123456",
	"statefile" : "dam-statefile.json",
        "sql" : [
	  {
		"statement":"SELECT dam_asset.id as _id, dam_repository.owner as owner, dam_asset.content_type, dam_asset.path, dam_asset.artifact_id as filename,dam_asset.keywords as tag, dam_asset.last_modified FROM dam_asset INNER JOIN dam_repository ON dam_asset.repository_id = dam_repository.id WHERE dam_asset.path <> '"'"'/'"'"' AND dam_repository.format='"'"'raw'"'"' AND dam_asset.last_modified > ?",
		"parameter" : [ "$metrics.lastexecutionstart" ]
	  }
	],
	"metrics" : {
            	"enabled" : true,
       		"lastexecutionend" : "2014-07-06T09:08:06.076Z",
      		"counter" : "1",
     		"lastexecutionstart" : "2014-07-06T09:08:00.948Z"
   	 },
	"index" : "dam",
	"type" : "asset"
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter
