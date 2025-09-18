#!/bin/bash

API_KEY="b0e8a330c9a444f4707a4a557e1b9c08"
UNIT="metric"

CURRENT_LOC=$(curl -s https://ipinfo.io/loc)
LAT=$(echo $CURRENT_LOC | cut -d',' -f1)
LON=$(echo $CURRENT_LOC | cut -d',' -f2)

DATA=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&appid=$API_KEY&units=$UNIT")

# Check if API returned valid data
if echo "$DATA" | grep -q '"cod":401'; then
    echo "Invalid API key"
    exit 1
fi

TEMP=$(echo $DATA | grep -o '"temp":[0-9.]*' | head -1 | sed 's/"temp"://')

echo "$TEMP °C"
