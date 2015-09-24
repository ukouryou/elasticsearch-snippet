#!/bin/sh
commands=(
"curl -XPUT 'localhost:9200/project' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/project/_close' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPUT 'localhost:9200/project/_settings' -d @project-settings.json -m 10 -o /dev/null -s -w %{http_code}" 
"curl -XPUT 'localhost:9200/project/_mapping/projectmeta' -d @project-mapping.json -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/project/_open' -I -m 10 -o /dev/null -s -w %{http_code}"
)
for i in "${commands[@]}"
do
    echo $i
    responsecode=`eval "$i"`
    echo $responsecode
    sleep 3
done
