#!/bin/sh
curl -XPUT 'localhost:9200/course'
curl -XPOST 'localhost:9200/course/_close'
curl -XPUT 'localhost:9200/course/_settings' -d @course-settings.json 
curl -XPUT 'localhost:9200/course/_mapping/coursemeta' -d @course-mapping.json 
curl -XPOST 'localhost:9200/course/_open'

