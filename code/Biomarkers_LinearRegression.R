#########################################################################################################
# https://graysonwhite.com/gglm/reference/gglm.html
# Provides four standard visual model diagnostic plots with `ggplot2`.
# Train bayesian network from discrete data 
colnames(subselect_merge_water_viscous)<-c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo","n","BHP","H")
#########################################################################################################
Efficiency_lm<-lm(formula=n ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo, data=subselect_merge_water_viscous)
Head_lm      <-lm(formula=H ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo, data=subselect_merge_water_viscous)
BHP_lm       <-lm(formula=BHP ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo, data=subselect_merge_water_viscous)
#########################################################################################################
# Write the results in tsv files
write.table(data.frame(summary(Efficiency_lm)$coefficients), file = paste(output_dir,"Efficiency_coefficientes.txt",sep=""))
write.table(data.frame(summary(Head_lm)$coefficients), file = paste(output_dir,"Head_coefficientes.txt",sep=""))
write.table(data.frame(summary(BHP_lm)$coefficients), file = paste(output_dir,"BHP_coefficientes.txt",sep=""))
########################################################################################################
# Take all possible combinations of size n
possible_combinations_n<-combn(c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo"), 2)

# Start data frame to strore results
df_results<-data.frame(col1=0,col2=0,col3=0,col4=0,col5=0)

# Rename collumns
colnames(df_results)<-c("interaction",colnames(summary(Efficiency_lm)$coefficients))

# Remove first row
df_results_efficiency<-df_results
df_results_bhp<-df_results
df_results_head<-df_results


# For alll posible resultes
for (m in 1:dim(possible_combinations_n)[2])
{
  # Take the interaction
  Formula_n   <-as.formula(paste("n ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo + ",paste(possible_combinations_n[,m],collapse=" * "),sep=""))
  Formula_H   <-as.formula(paste("H ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo + ",paste(possible_combinations_n[,m],collapse=" * "),sep=""))
  Formula_BHP <-as.formula(paste("BHP ~ Q + Tm.i + Tm.o + P1 + P2 + RPM + T + pi + mi + mo + ",paste(possible_combinations_n[,m],collapse=" * "),sep=""))

  # Add the ineractions pair
  Efficiency_lm<-lm(formula=Formula_n, data=subselect_merge_water_viscous)
  Head_lm      <-lm(formula=Formula_H, data=subselect_merge_water_viscous)
  BHP_lm       <-lm(formula=Formula_BHP, data=subselect_merge_water_viscous)

  # Take the sresults 
  Efficiency_lm_coeff<-summary(Efficiency_lm)$coefficients
  Head_lm_coeff      <-summary(Head_lm)$coefficients
  BHP_lm_coeff       <-summary(BHP_lm)$coefficients

  # Take the index of the interaction
  index_interaction_efficiencty<-which(rownames(Efficiency_lm_coeff) %in% paste(possible_combinations_n[,m],collapse=":"))
  index_interaction_Head<-which(rownames(Head_lm_coeff) %in% paste(possible_combinations_n[,m],collapse=":"))
  index_interaction_BHP<-which(rownames(BHP_lm_coeff) %in% paste(possible_combinations_n[,m],collapse=":"))    
  
  # Check if the interaction is different than integer(0)
  if (! (is.integer(index_interaction_efficiencty) && length(index_interaction_efficiencty) == 0L))
  { 
      # Store the results 
      df_results_efficiency<-rbind(df_results_efficiency,interaction=c(paste(possible_combinations_n[,m],collapse=" * "),Efficiency_lm_coeff[index_interaction_efficiencty,]))
  }
  
  # Check if the interaction is different than integer(0)
  if (! (is.integer(index_interaction_Head) && length(index_interaction_Head) == 0L))
  { 
      # Store the results 
      df_results_head<-rbind(df_results_head,interaction=c(paste(possible_combinations_n[,m],collapse=" * "),Head_lm_coeff[index_interaction_Head,]))
  }

  # Check if the interaction is different than integer(0)
  if (! (is.integer(index_interaction_BHP) && length(index_interaction_BHP) == 0L))
  { 
      # Store the results 
      df_results_bhp<-rbind(df_results_bhp,interaction=c(paste(possible_combinations_n[,m],collapse=" * "),BHP_lm_coeff[index_interaction_BHP,]))
  }  
}
#########################################################################################################
# Remove the first line
df_results_efficiency<-df_results_efficiency[-1,]
df_results_head      <-df_results_head[-1,]
df_results_bhp       <-df_results_bhp[-1,]
#########################################################################################################
# Write the results in tsv files
write_tsv(df_results_efficiency, path = paste(output_dir,"Efficiency_coefficientes_interactions.txt",sep=""))
write_tsv(df_results_head, path = paste(output_dir,"Head_coefficientes_interactions.txt",sep=""))
write_tsv(df_results_bhp, path = paste(output_dir,"BHP_coefficientes_interactions.txt",sep=""))
########################################################################################################
