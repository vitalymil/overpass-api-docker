#!/bin/bash

source conf.sh

docker rm -f osm-overpass
docker run -d -v $(pwd)/../data:/rep_data -p 7000:80 \
           --name osm-overpass --network osm_network osm/overpass