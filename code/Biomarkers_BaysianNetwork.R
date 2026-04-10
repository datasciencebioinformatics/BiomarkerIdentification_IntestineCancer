#########################################################################################################
df<-data.frame(read_counts_table_tpm_disc)
df[sapply(df, is.character)] <- lapply(df[sapply(df, is.character)], as.factor)

# Keep only factors with more than one level
df_clean <- df[, sapply(df, nlevels) > 1]


# Create bayesian networks
bn_cancer_data <- tabu(data.frame(df_clean))

# bwplot               
png(filename=paste(output_dir,"Bayesian_Network_structure_Tissue_Type.png",sep=""), width = 17, height = 17, res=600, units = "cm")  
  # Plot the bayesian network graph
  plot(as.igraph(bn_cancer_data), vertex.color="black",vertex.size=25,vertex.label.color="orange",layout=layout_with_kk,  vertex.label=)
dev.off()
#########################################################################################################
