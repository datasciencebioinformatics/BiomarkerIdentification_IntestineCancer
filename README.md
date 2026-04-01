# BiomarkerIdentification_ProstateCancer

## Pre-processment in bash 
### 1- Set up the Project_Configuration.txt file
Project_Configuration.txt

### 2- gdc-client command line to download the samples from the PortalGdcCancer cancer database
gdc-client download -m $star_gene_counts_manifest_file --dir $project_folder

## Differential expression framework in R
### 3- Load R packages
source(paste(project_folder,"/code/Load_All_R_Packages.R",sep=""))

### 4- Generate read counts table 
source(paste(project_folder,"/code/Generate_read_counts_table.R",sep=""))




