

# Sonora COVID Cases Analysis

This is a project from the **["Herramientas para Ciencia de Datos] (https://mcd-unison.github.io/curso-hpcd/ "course website")"** course implemented by the [***Universidad of Sonora***] (https://www.unison.mx/). This page will guide you through the process of cleaning data provided by the [***Secretaría de Salud in México***] (https://www.gob.mx/salud/documentos/datos-abiertos-152127). 
All information updated as of today represents the fist stage of this project (downloading and preparing the data). The following lines guide you through this stage as there is a repository and a script allowing this project to be replicable for anyone who wishes.
Let’s get started!

esta es una [prueba] (https://mcd-unison.github.io/curso-hpcd/) para detrminar

esta es una [prueba] [1] para detrminar
[1]: <https://mcd-unison.github.io/curso-hpcd/>

### Downloading everything you need
In order to set the environment for this project you must clone the [Proyecto_COVID_HPCD] (https://github.com/MichelleVlza/Proyecto_COVID_HPCD) repository in Github. It includes a [Dockerfile] (https://github.com/MichelleVlza/Proyecto_COVID_HPCD/blob/main/MichelleValenzuela.dockerfile) and a [script] (https://github.com/MichelleVlza/Proyecto_COVID_HPCD/blob/main/Script.sh).

Run the Dockerfile, this will cerate an ubuntu container and install all the tools that we need in it (´nano, curl, unzip, less, pip, tldr, csvkit´).

Next the docker file will run the Script.sh, this script will do the following:
  -Download the data from the Secretaría de Salud in México.
    >´curl -L -O https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip´


  -Unzip the file, feel free to name it as you want.
    >´unzip datos_abiertos_covid19.zip´


#### Cleaning the data
Use cvskit to clean the data.
  -Select only data from people who live in Sonora.
    >´csvgrep -c ENTIDAD_RES -m 26 220216COVID19MEXICO.csv > Sonora_data.csv´


  -Select people who came out positive for COVID-19.
    >´csvgrep -c RESULTADO_LAB -m 1 Sonora_data.csv > Covid_data.csv´

  -Select only the columns we need.
    >´csvcut -c 1,2,6,8,10,11,12,13,14,15,16,18,20,21,22,23,24,25,26,27,28,29,30,31,33,40 Covid_data.csv > Sonora_COVID.csv´


Now you are done, the data is ready for analysis and we are up to the first stage of this project. 
I recommend you to stay tuned for the following updates for the analysis of the data. ;)

