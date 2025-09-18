#!/bin/bash

API_KEY="kurwa no see here man"
UNIT="metric"

CURRENT_LOC=$(curl -s https://ipinfo.io/loc)
LAT=$(echo $CURRENT_LOC | cut -d',' -f1)
LON=$(echo $CURRENT_LOC | cut -d',' -f2)

DATA=$(curl -s "https://api.openweathermap.org/data/3.0/onecall?lat=$LAT&lon=$LON&exclude=minutely,hourly,daily,alerts&appid=$API_KEY&units=$UNIT")

TEMP=$(echo "$DATA" | jq '.current.temp')

echo "$TEMP°C"
