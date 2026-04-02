###################################################################################
# Set the project configuration
# Set the path to manifest file
Manifest_file=paste(project_folder,"gdc_manifest.2026-04-01.072557.txt",sep="")

# Set the path to metadata cohort file
Metadata_file=paste(project_folder,"metadata.cohort.2026-04-01.json",sep="")

# Set the path to Sample sheet file
Sample_sheet_file=paste(project_folder,"gdc_sample_sheet.2026-04-01.tsv",sep="")

# Set the path to biospecimen cohort file
Biospecimen_file=paste(project_folder,"biospecimen.cohort.2026-04-01.tar.gz",sep="")

# Set the path to clinical cohort file
Clinical_file=paste(project_folder,"clinical.cohort.2026-04-01.tar.gz",sep="")

# Set the path to clinical file
clinical_file=paste(project_folder,"metadata/clinical.tsv",sep="")

# Set the path to sample file
sample_file=paste(project_folder,"metadata/sample.tsv",sep="")
###################################################################################
# Load clinical data
clinical_data<-read.delim(file = clinical_file, sep = '\t', header = TRUE,fill=TRUE)

# Load sample data
sample_data<-read.delim(file = sample_file, sep = '\t', header = TRUE,fill=TRUE)

# 
