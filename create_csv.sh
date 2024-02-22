#!/bin/bash
csv_input_path=$1
tmp_csv_output=$2

echo "Timestamp,Latitude,Longitude,MinSeaLevelPressure,MaxIntensity" > $tmp_csv_output
dtg="$(grep -R "<dtg>" $csv_input_path | sed 's/.*<dtg>//g' | sed 's/[</dtg>]//g')"
grep -R "<lat>" $csv_input_path| sed 's/.*<lat>//g' | sed 's/[</lat>]//g' > lat.csv
grep -R "<lon>" $csv_input_path | sed 's/.*<lon>//g' | sed 's/[</lon>]//g' > lon.csv
grep -R "<minSeaLevelPres>" $csv_input_path | sed 's/.*<minSeaLevelPres>//g' | sed 's/[</minSeaLevelPres>]//g' > minSeaLevelPres.csv
grep -R "<intensity>" $csv_input_path | sed 's/.*<intensity>//g' | sed 's/[</intensity>]//g' > intensity.csv
lat="$(sed "s/$/ N/" lat.csv)"
lon="$(sed "s/$/ W/" lon.csv)"
minSeaLevelPres="$(sed "s/$/ mb/" minSeaLevelPres.csv)"
maxIntensity="$(sed "s/$/ knots/" intensity.csv)"
paste -d',' <(echo "$dtg") <(echo "$lat") <(echo "$lon") <(echo "$minSeaLevelPres") <(echo "$maxIntensity") >> $tmp_csv_output
rm lat.csv
rm lon.csv
rm minSeaLevelPres.csv
rm intensity.csv