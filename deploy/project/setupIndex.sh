#!/bin/sh
curl -XPUT 'localhost:9200/project'
curl -XPOST 'localhost:9200/project/_close'
curl -XPUT 'localhost:9200/project/_settings' -d @project-settings.json 
curl -XPUT 'localhost:9200/project/_mapping/projectmeta' -d @project-mapping.json 
curl -XPOST 'localhost:9200/project/_open'
#curl -XDELETE 'localhost:9200/project/projectmeta'
