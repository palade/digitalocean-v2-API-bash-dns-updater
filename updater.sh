#!/bin/bash
#Description: Dynamically updates an A record on Digital Oceans domain server.
#Author: Andrei Palade (andrey.palade at googlemail dot com)
#Date: 08.02.2015

TOKEN=""
RECORD_ID=""
DOMAIN_NAME=""

#Retrieve current WAN IP
NIP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
#echo [$(date +"%d-%m-%Y-%T")] "CURRENT WAN IP: " $NIP  >> log.txt

#Retrieve past WAN IP
CIP=$(curl -X GET -H 'Content-Type: application/json' -H 'Authorization: Bearer '$TOKEN'' "https://api.digitalocean.com/v2/domains/"$DOMAIN_NAME"/records/"$RECORD_ID"" | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["domain_record"]["data"]')
#echo [$(date +"%d-%m-%Y-%T")] "DO WAN IP: " $CIP  >> log.txt


#Compare past WAN IP and with current WAN IP
if [ "$NIP" != "$CIP" ]; then
   curl -X PUT -H 'Content-Type: application/json' -H 'Authorization: Bearer '$TOKEN'' -d '{"data":"'"$NIP"'"}' "https://api.digitalocean.com/v2/domains/"$DOMAIN_NAME"/records/"$RECORD_ID
   #echo [$(date +"%d-%m-%Y-%T")] "UPDATING WAN IP TO: " $NIP  >> log.txt
else
   #echo [$(date +"%d-%m-%Y-%T")] "NO CHANGES IN WAN: "$NIP" - "$CIP  >> log.txt
fi


