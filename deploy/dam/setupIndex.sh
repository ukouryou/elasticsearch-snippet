#!/bin/bash
commands=(
"curl -XPUT 'localhost:9200/dam' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/dam/_close' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPUT 'localhost:9200/dam/_settings' -d @dam-settings.json -m 10 -o /dev/null -s -w %{http_code}" 
"curl -XPUT 'localhost:9200/dam/_mapping/asset' -d @dam-mapping.json -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/dam/_open' -I -m 10 -o /dev/null -s -w %{http_code}"
)
for i in "${commands[@]}"
do
    echo $i
    responsecode=`eval "$i"`
    echo $responsecode
    sleep 3
done
