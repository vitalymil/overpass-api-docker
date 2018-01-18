#!/bin/bash

#===================================
#You can change the following params
#===================================

#On which server TCP port the API should be available ?
# i.e., the API will be accessible on http://YOUR_SERVER_IP:[PORT]/api
#Normally you want to have a proxy between the outside world and the API
SERVER_HTTP_PORT=5001


#What is your email ? So others can contact you in case
VHOST_EMAIL=your_email@example.net

#Your FQDN the server will be available on. Only for æsthetic purposes
VHOST_FQDN=overpass.server.example.net



#Which minute replication server should be used
REPLICATE_SERVER=http://localhost/rep_data/minutely-export

PLANET_FILE=http://localhost/rep_data/planet.osm.bz2




#=====================================
#Don't change anything below this line
#=====================================

OPASS_MAIN=/Overpass-API
BINDIR=$OPASS_MAIN/src/bin
EXECDIR=$OPASS_MAIN/src
DBDIR=/rep_data/overpass-db

RULES_LOGFILE=$DBDIR/rules_loop.log

