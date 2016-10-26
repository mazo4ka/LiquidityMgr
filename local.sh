#!/bin/bash

DIR=`pwd`
echo "Starting loacal proxy $DIR"
API_ADDR=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
echo "Api addr $API_ADDR"
sed -e "s;API_ADDR;${API_ADDR};g" $DIR/nginx/nginx.conf.template > $DIR/nginx/nginx.conf
docker run --rm -it -p 8082:8082 -v $DIR/nginx:/etc/nginx:ro -v $DIR:/www:ro --name zont nginx
