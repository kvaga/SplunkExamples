#!/bin/bash
function usage(){
        echo "Usage: $0 path/to/folderi sourcetype filePrefix";
}
if [ -z $1 ];
then
        usage
        exit 1;
fi;
if [ -z $2 ];
then
        usage
        exit 1;
fi;
if [ -z $3 ];
then
        usage
        exit 1;
fi;

FOLDER=$1;
#echo FOLDER=$FOLDER
#echo PATH=$PATH
SOURCETYPE=$2
echo SOURCETYPE=$SOURCETYPE
PREFIX=$3
echo PREFIX=$PREFIX
for d in $(find $FOLDER -type d );
#for d in folder1 folder2 folder3;
        do
        PATH_LOGS=$d;
        #echo PATH_LOGS=$PATH_LOGS;
        #HOST=$HATH_LOGS
        #echo basename $d;
        HOST=$(basename $d);
        #echo HOST=$HOST;
        echo "[monitor://$PATH_LOGS/$PREFIX*]";
        echo "disabled = false";
        echo "index = pprb_ts_temp1";
        echo "sourcetype=$SOURCETYPE";
        echo "whitelist = $PREFIX[^/]*\.(?:log|zip|gz)$";
        echo "host=$HOST";
        echo "crcSalt = <SOURCE>";
        echo ""
done;

