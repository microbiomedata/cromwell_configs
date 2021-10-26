# Shifter Standalone Example

This is for running Cromwell with Shifter in standalone mode.


## Prequisites

* Shifter must be installed (obviously)
* Skopeo needs to be installed
* Copy shifter_exec.sh and pull_by_id to location and add it to your PATH


## Example

This assumes `shifter_exec.sh` and `pull_by_id` are in the local directory.

``` bash
PATH=`pwd`:$PATH
java -Dconfig.file=./shifter.conf run my.wdl -i input.json
```
