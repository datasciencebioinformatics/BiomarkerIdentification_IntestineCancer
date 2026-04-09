# BiomarkerIdentification_ProstateCancer
project_folder="/home/felipe/Documents/BiomarkerIdentification_ProstateCancer/"
project_folder="C:/Users/felip/OneDrive/Documentos/GitHub/BiomarkerIdentification_ProstateCancer/"

# Add the version control
source(paste(project_folder,"/code/Version_Control.R",sep=""))

## Differential expression framework in R
### 1- Load R packages
source(paste(project_folder,"/code/Load_All_R_Packages.R",sep=""))

### 2- Generate read counts table 
source(paste(project_folder,"/code/Generate_read_counts_table.R",sep=""))

### 3- Differential expression analyss
source(paste(project_folder,"/code/Differential_Expression_Analysis.R",sep=""))

### 4- Biomarkers identification
source(paste(project_folder,"/code/Biomarkers_Identification.R",sep=""))

### 5- Biomarkers assessment
source(paste(project_folder,"/code/Biomarkers_Assessment.R",sep=""))

### 6- Select biomartkers with stepAIC
source(paste(project_folder,"/code/SelectBiomartkers_with_stepAIC.R",sep=""))

### 7- Unsupervised analyses
#### Heatmap with the tumor genes
#### Add information about stages
source(paste(project_folder,"/code/Unsupervised_Analyses.R",sep=""))

### 8- Decision tree analyses
#### StepAIC variable selection from tumor_genes
#### Decision tree tumor_genes
source(paste(project_folder,"/code/DecisionTree_Analyses.R",sep=""))









