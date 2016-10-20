#!/bin/bash

if [ $# -ne 3 ]
  then
      echo "Wrong number of arguments supplied."
      echo "Correct syntax: save_etcd.sh [etcd_url] [key] [file output]."
      exit 1
fi

ETCD_URL=$1
KEY=$2
FILE_OUT=$3

LINES="$(curl $ETCD_URL/v2/keys/$KEY | python -m json.tool | grep value | sed 's/ //g' | cut -d ':' -f2-13 | sed 's/\\//g' | sed 's/^.\(.*\).$/\1/')"
for i in $LINES; do
    $(echo $i >> $FILE_OUT)
done



