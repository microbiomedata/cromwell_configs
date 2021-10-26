#!/bin/bash
# This should point to the location of any reference
# databases.  This will be mounted as /refdata in the container.
#
RD=/global/cfs/projectdirs/m3408/aim2/database/

IMG=$1

if [ $(echo ${IMG}|grep -c sha256) -gt 0 ] ; then
	ID=id:$(pull_by_id ${IMG})
	echo $ID
else
	ID=$1
fi

# Debug
#printenv > ~/crom.deb
shifter --image=$ID -V `pwd`/cromwell-executions:/cromwell-executions -V $RD:/refdata $2 $3

