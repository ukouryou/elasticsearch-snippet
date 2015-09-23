#!/bin/sh
curl -XPUT 'localhost:9200/dam'
curl -XPOST 'localhost:9200/dam/_close'
curl -XPUT 'localhost:9200/dam/_settings' -d @dam-settings.json 
curl -XPUT 'localhost:9200/dam/_mapping/asset' -d @dam-mapping.json 
curl -XPOST 'localhost:9200/dam/_open'

