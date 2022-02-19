
# Introduction

This project is part of the **"[Herramientas para Ciencia de Datos](https://mcd-unison.github.io/curso-hpcd/)"** course, implemented by the [***Universidad of Sonora***](https://www.unison.mx/), using data provided by the [***Secretaría de Salud in México***](https://www.gob.mx/salud/documentos/datos-abiertos-152127).


All information updated as of today represents the first stage of this project, downloading and preparing the COVID-19 data set for further analysis, this page will guide you through this stage as there is a repository and a script allowing this project to be replicable for anyone.

Let’s get started!




### Downloading everything you need


##### You need to have [Docker](https://www.docker.com/products/docker-desktop) and [GIT](https://git-scm.com/download/win) installed in orded to follow up the next instructions. #####


To set the environment for this project you must clone the [Proyecto_COVID_HPCD](https://github.com/MichelleVlza/Proyecto_COVID_HPCD) repository in Github, it includes a [Dockerfile](https://github.com/MichelleVlza/Proyecto_COVID_HPCD/blob/main/MichelleValenzuela.dockerfile) and a [Script](https://github.com/MichelleVlza/Proyecto_COVID_HPCD/blob/main/Script.sh).

```
git clone https://github.com/MichelleVlza/Proyecto_COVID_HPCD.git
```



Then, take your docker terminal to that directory (Proyecto_COVID_HPCD) and create a container with the Dockerfile, which will install all the tools that we'll need (`nano, curl, unzip, less, pip, tldr, csvkit`), and copy the `Script.sh`. Use the following command to do that...

```
docker build -t username/covid_proj .
docker run -it --name name username/covid_proj
```




### Cleaning the data


The `Script.sh` will:  

  
  - Download the data from the Secretaría de Salud in México.
         
```
curl -L -O https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip
```



  - Unzip the file, feel free to name it as you want.
    
 ```
 unzip datos_abiertos_covid19.zip
 ```

  
  
  - Select only data from people who live in Sonora.
    
```
csvgrep -c ENTIDAD_RES -m 26 220216COVID19MEXICO.csv > Sonora_data.csv
```


  - Select people who came out positive for COVID-19.
    
```
csvgrep -c RESULTADO_LAB -m 1 Sonora_data.csv > Covid_data.csv
```


  - Select only the columns we need.

```
csvcut -c 1,2,6,8,10,11,12,13,14,15,16,18,20,21,22,23,24,25,26,27,28,29,30,31,33,40 Covid_data.csv > Sonora_COVID.csv
```



Now you are done, a **Sonora_COVID.csv** file will be created meaning the data is ready for analysis and we are up to the first stage of this project. 
I recommend you to stay tuned for the following updates for the analysis of the data. ;)

