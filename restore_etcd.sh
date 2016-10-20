#!/bin/bash

if [ $# -ne 3 ]
  then
      echo "Wrong number of arguments supplied."
      echo "Correct syntax: restore_etcd.sh [etcd_url] [key] [file input]."
      exit 1
fi

ETCD_URL=$1
KEY=$2
FILE_IN=$3

while read -r LINE
do
    $(curl -s $ETCD_URL/v2/keys/$KEY -XPOST --data-urlencode value=$LINE)
done < $FILE_IN

echo "Done"


