#!/bin/sh


export PATH=$PATH:/usr/local/openjdk-8/bin

cat /app/server.conf.tmpl | \
   sed "s/DB_PASSWORD/${DB_PASSWORD}/" \
   > /app/server.conf


cat /etc/condor/condor_config.local.tmpl | \
   sed "s/_CONDOR_NAME_/${CONDOR_NAME}/" | \
   sed "s/_CONDOR_HOST_/${CONDOR_HOST}/" | \
   sed "s/_CONDOR_SCHEDD_/${CONDOR_SCHEDD}/" | \
   sed "s|_CONDOR_PASSWORD_|${CONDOR_PASSWORD}|"  \
   > /etc/condor/condor_config.local

cd /global/project/projectdirs/m3408/aim2/cromwell

java -Dconfig.file=/app/server.conf -jar /app/cromwell.jar server  > server.out 2> server.err


