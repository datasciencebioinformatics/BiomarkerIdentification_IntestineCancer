# BiomarkerIdentification_ProstateCancer

## Pre-processment in bash 
### 1- Set up the Project_Configuration.txt file
config/Project_Configuration.txt

### 2- Filter Sample Sheet and Manifest files
##### Give permission to execute the bash script
chmod a+x $project_folder$FilterSampleSheet_Manifest_files.sh

##### Execute the bash script
$project_folder$FilterSampleSheet_Manifest_files.sh

### 2- gdc-client command line to download the samples from the PortalGdcCancer cancer database
gdc-client download -m $star_gene_counts_manifest_file --dir $project_folder

## Differential expression framework in R
### 3- Load R packages
source(paste(project_folder,"/code/Load_All_R_Packages.R",sep=""))

### 4- Generate read counts table 
source(paste(project_folder,"/code/Generate_read_counts_table.R",sep=""))




