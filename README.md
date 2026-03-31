# BiomarkerIdentification_IntestineCancer

## Pre-processment in bash 
### 1- Set up the Project_Configuration.txt file
#### project_folder    : /home/felipe/Documentos/BiomarkerIdentification_IntestineCancer/
#### Manifest file     : gdc_manifest.2026-03-31.143944.txt
#### Metadata file     : metadata.cohort.2026-03-31.json
#### Sample sheet file : gdc_sample_sheet.2026-03-31.tsv
#### Biospecimen file  : biospecimen.cohort.2026-03-31.tar.gz
#### Clinical file     : clinical.cohort.2026-03-31.tar.gz
Project_Configuration.txt


### 2- gdc-client command line to download the samples from the PortalGdcCancer cancer database
gdc-client download -m $project_folder$path_to_gdc_manifest_file --dir $project_folder

### 3- bash script to process the downladed files into reads count tables
$project_folder"bash/BiomarkerIdentification_IntestineCancer_Download_Tabel_From_PortalGdcCancer.sh"


## Differential expression framework in R
### 4- Pacotes R utilizados
source(paste(project_folder,"/code/Load_All_R_Packages.R",sep=""))


