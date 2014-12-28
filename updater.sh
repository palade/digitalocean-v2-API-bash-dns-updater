#!/bin/bash
#Description: Dynamically updates an 'A' record on Digital Oceans domain server.
#Author: Andrei Palade (andrey.palade at googlemail doc com)
#Date: 28.12.2014

TOKEN=""
RECORD_ID=""
DOMAIN_NAME=""

echo "Retrieve current WAN IP..."
NIP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

echo "Retrieve past WAN IP..."
if [ ! -f $PWD/cip.txt ]; then
   CIP="0.0.0.0"
else
   CIP=$(cat $PWD/cip.txt)
fi

echo "Compare past WAN IP and with current WAN IP..."
if [ "$NIP" != "$CIP" ]; then
   echo "Setting the new WAN IP..."
   if [ -f $PWD/cip.txt ]; then
      rm $PWD/cip.txt
   fi
   echo $NIP > cip.txt
   curl -X PUT -H 'Content-Type: application/json' -H 'Authorization: Bearer '$TOKEN'' -d '{"data":"'"$NIP"'"}' "https://api.digitalocean.com/v2/domains/"$DOMAIN_NAME"/records/"$RECORD_ID
else
   echo "No changes in WAN IP!"
fi

echo
echo "Done!"
