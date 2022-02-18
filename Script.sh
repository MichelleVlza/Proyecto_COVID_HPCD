echo "Downloading COVID dataset"
curl -L -O https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip

echo "Unzipping file"
unzip datos_abiertos_covid19.zip


for file in *.csv; do
	echo "Cleaning data to obtain only positive cases of COVID-19 in Sonora"
	csvgrep -c ENTIDAD_RES -m 26 220216COVID19MEXICO.csv > Sonora_data.csv
	csvgrep -c RESULTADO_LAB -m 1 Sonora_data.csv > Covid_data.csv
    csvcut -c 1,2,6,8,10,11,12,13,14,15,16,18,20,21,22,23,24,25,26,27,28,29,30,31,33,40 Covid_data.csv > Sonora_COVID.csv
done

echo "Cleaned dataset .csv file, ready for further analysis:"
rm Sonora_data.csv
rm Covid_data.csv
ls Sonora_COVID.csv

