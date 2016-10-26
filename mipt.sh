#!/bin/bash

DIR=`pwd`
echo "Starting loacal proxy $DIR"
API_ADDR="zont2-d1.msk.trd.ru"
echo "Api addr $API_ADDR"
sed -e "s;API_ADDR;${API_ADDR};g" $DIR/nginx/nginx.conf.template | sed -e "s;8082;8085;g"  > $DIR/nginx/nginx.conf
docker run -d -p 8085:8085 -v $DIR/nginx:/etc/nginx:ro -v $DIR:/www:ro --name zont-mipt nginx
