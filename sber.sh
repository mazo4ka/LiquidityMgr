#!/bin/bash

DIR=`pwd`
echo "Starting loacal proxy $DIR"
API_ADDR="127.0.0.1"
echo "Api addr $API_ADDR"
sed -e "s;API_ADDR;${API_ADDR};g" $DIR/nginx/nginx.conf.template > $DIR/nginx/nginx.conf
docker run --net=host -d -v $DIR/nginx:/etc/nginx:ro -v $DIR:/www:ro --name zont-new nginx
