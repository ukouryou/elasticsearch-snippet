#!/bin/bash
indexNames=( "dam" "project" "course" )
for i in "${indexNames[@]}"
do
    echo $i
    cd $i
    pwd
    bash setupIndex.sh
    cd ..
done
