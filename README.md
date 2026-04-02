# BiomarkerIdentification_ProstateCancer

## Differential expression framework in R
### 1- Load R packages
source(paste(project_folder,"/code/Load_All_R_Packages.R",sep=""))

### 2- Generate read counts table 
source(paste(project_folder,"/code/Generate_read_counts_table.R",sep=""))

#### to use STAR aligner counts in DESeq2, extract the ReadsPerGene.out.tab file for each sample, select the appropriate column (usually 2nd for unstranded, 3rd/4th for stranded), and combine them into a single raw count matrix, ensuring genes are rows and samples are columns. This matrix is then imported into R, matched with metadata, and loaded into DESeq2 using DESeqDataSetFromMatrix




