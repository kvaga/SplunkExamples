#!/bin/bash
if [ -z $1 ];
then
        echo "Usage: $0 path/to/folderi sourcetype";
        exit 1;
fi;
if [ -z $2 ];
then
        echo "Usage: $0 path/to/folderi sourcetype";
        exit 1;
fi;

FOLDER=$1;
#echo FOLDER=$FOLDER
#echo PATH=$PATH
SOURCETYPE=$2
echo SOURCETYPE=$SOURCETYPE
PREFIX=$SOURCETYPE
echo PREFIX=$PREFIX
for d in $(find $FOLDER -type d );
#for d in UKO16 UKO18 UKO40 UKO42 UKO44 UKO52 UKO54 UKO55 UKO70 UKO78 USV13 USV16 USV18 USV38 USV40 USV42 USV44 USV52 USV54 USV55 USV70;
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
