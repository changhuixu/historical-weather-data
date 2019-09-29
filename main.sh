#!/bin/bash

FILE=./docs/assets/data/`date +"%Y%m%d"`.json
if [ -f "$FILE" ]; then
    echo "$FILE exists. Done for today."
else
    echo "Begin to get today's weather condition."
    url="http://api.openweathermap.org/data/2.5/weather?id=4862034&units=metric&APPID="$API_KEY
    response=$(curl -f "$url")
    status=$?
    if [ $status -eq 0 ]; then
        echo $response > $FILE
        echo "$FILE saved."
        echo `date +"%Y%m%d"` >> ./docs/assets/data.txt
    else
        echo "curl exit code: ($status) $response"
        exit $status
    fi
fi
