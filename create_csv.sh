#!/bin/bash
csv_input_path=$1
tmp_csv_output=$2

echo "Timestamp,Latitude,Longitude,MinSeaLevelPressure,MaxIntensity" > $tmp_csv_output
dtg="$(grep -R "<dtg>" $csv_input_path| sed 's/.*<dtg>//g' | sed 's/[</dtg>]//g')" >> $tmp_csv_output
lat="$(cat $csv_input_path | grep "<lat>" | sed 's/.*<lat>//g' | sed 's/[</lat>]//g')"
lon="$(cat $csv_input_path | grep "<lon>" | sed 's/.*<lon>//g' | sed 's/[</lon>]//g')"
minSeaLevelPres="$(cat $csv_input_path | grep "<minSeaLevelPres>" | sed 's/.*<minSeaLevelPres>//g' | sed 's/[</minSeaLevelPres>]//g')"
maxIntensity="$(cat $csv_input_path | grep "<intensity>" | sed 's/.*<intensity>//g' | sed 's/[</intensity>]//g')"
paste -d',' <(echo "$dtg") <(echo "$lat") <(echo "$lon") <(echo "$minSeaLevelPres") <(echo "$maxIntensity") >> $tmp_csv_output
#NAME=${dtg}_${lat}_${lon}_${minSeaLevelPres}_${maxIntensity}
#echo $NAME >> $tmp_csv_output