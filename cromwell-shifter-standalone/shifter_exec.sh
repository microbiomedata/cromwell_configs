#!/bin/bash
CACHE=/global/common/software/m3408/cromwell/cache

if [ $(echo $1|grep -c sha256) -gt 0 ] ; then
  ID="id:$(grep $1 $CACHE|awk '{print $2}')"
else
  ID=$1
  # shifterimg pull $1
fi

CE=/global/cfs/projectdirs/m3408/aim2/cromwell/cromwell-executions/
CE=/global/cfs/cdirs/m3408/aim2/mg_annotation/test/cromwell-executions/

RD=/global/cfs/projectdirs/m3408/aim2/database/

shifter --image=$ID -V $CE:/cromwell-executions -V $RD:/refdata $2 $3

