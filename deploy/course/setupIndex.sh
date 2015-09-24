#!/bin/sh
commands=(
"curl -XPUT 'localhost:9200/course' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/course/_close' -I -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPUT 'localhost:9200/course/_settings' -d @course-settings.json -m 10 -o /dev/null -s -w %{http_code}" 
"curl -XPUT 'localhost:9200/course/_mapping/coursemeta' -d @course-mapping.json -m 10 -o /dev/null -s -w %{http_code}"
"curl -XPOST 'localhost:9200/course/_open' -I -m 10 -o /dev/null -s -w %{http_code}"
)
for i in "${commands[@]}"
do
    echo $i
    responsecode=`eval "$i"`
    echo $responsecode
    sleep 3
done

