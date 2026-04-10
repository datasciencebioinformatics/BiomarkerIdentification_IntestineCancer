#########################################################################################################
# https://graysonwhite.com/gglm/reference/gglm.html
# Provides four standard visual model diagnostic plots with `ggplot2`.
# Train bayesian network from discrete data 
colnames(subselect_merge_water_viscous)<-c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo","n","BHP","H")
#########################################################################################################
# Calculate the lm
Tissue_type_lm<-lm(formula=Tissue_type ~ ., data=read_counts_table_tpm)

# Write the results in tsv files
write.table(data.frame(summary(Tissue_type_lm)$coefficients), file = paste(output_dir,"Tissue_type_coefficientes.txt",sep=""))

