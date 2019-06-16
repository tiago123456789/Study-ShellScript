#!/bin/bash

if [ ! -d log ]
then
    mkdir log
fi

generate_log_process(){
    ten_process_consume_more_memory=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9]);
    for pid in $ten_process_consume_more_memory
    do
        name_process=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S) >> log/$name_process.log
        size_memore_used=$(ps -p $pid -o size | grep [0-9])
        echo " $(bc <<< "scale=2;$size_memore_used/1024") MB" >> log/$name_process.log
    done
}

generate_log_process
if [ $? -eq 0 ]
then
    echo "Generate log success!"
else
    echo "Occour error to the generate log process!"
fi