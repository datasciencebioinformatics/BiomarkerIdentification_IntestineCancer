#########################################################################################################
# Split into trainning and testing
trainning<- as.vector(createDataPartition(subselect_merge_water_viscous$n,times = 1,p = 0.5,list = TRUE)[[1]])
testing <- which(!rownames(subselect_merge_water_viscous) %in% trainning)

# Split into trainning and testing
# Store trainning and testing data
trainingControl_features<-subselect_merge_water_viscous[trainning,]

# Store trainning and testing data
trainning_features<-subselect_merge_water_viscous[trainning,]
testing_features  <-subselect_merge_water_viscous[testing,]
#########################################################################################################
# Train bayesian network from discrete data 
colnames(subselect_merge_water_viscous)<-c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo","n","BHP","H")

# Subselect the variables
subselect_merge_water_viscous<-subselect_merge_water_viscous[,c("Q","Tm.i","Tm.o","P1","P2","T","pi","mi","mo","n","BHP","H")]

# Create bayesian networks
bn_viscour <- hc(subselect_merge_water_viscous)
tb_viscour <- tabu(discrete_renamed_water_viscous)

# bwplot               
png(filename=paste(output_dir,"Bayesian_Network_structure.png",sep=""), width = 17, height = 17, res=600, units = "cm")  
  # Plot the bayesian network graph
  plot(as.igraph(tb_viscour), vertex.color="black",vertex.size=25,vertex.label.color="orange",layout=layout_with_kk)
dev.off()



#########################################################################################################
# Split into trainning and testing
trainning<- as.vector(createDataPartition(discrete_merge_water_viscous$n,times = 1,p = 0.5,list = TRUE)[[1]])
testing <- which(!rownames(discrete_merge_water_viscous) %in% trainning)

# Split into trainning and testing
# Store trainning and testing data
trainingControl_features<-discrete_merge_water_viscous[trainning,]

# Store trainning and testing data
trainning_features<-discrete_merge_water_viscous[trainning,]
testing_features  <-discrete_merge_water_viscous[testing,]
#########################################################################################################
# Train bayesian network from discrete data 
colnames(discrete_merge_water_viscous)<-c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo","n","BHP","H")

# Subselect the variables
discrete_merge_water_viscous<-discrete_merge_water_viscous[,c("Q","Tm.i","Tm.o","P1","P2","T","pi","mi","mo","n","BHP","H")]

# Create bayesian networks
bn_viscour <- hc(discrete_merge_water_viscous)
tb_viscour <- tabu(discrete_merge_water_viscous)

# bwplot               
png(filename=paste(output_dir,"Bayesian_Network_structure_discrete.png",sep=""), width = 17, height = 17, res=600, units = "cm")  
  # Plot the bayesian network graph
  plot(as.igraph(tb_viscour), vertex.color="black",vertex.size=25,vertex.label.color="orange",layout=layout_with_kk)
dev.off()


# Create bayesian networks
bn_viscour = bn.fit(bn_viscour, discrete_merge_water_viscous,method = "mle")
tb_viscour = bn.fit(tb_viscour, discrete_merge_water_viscous,method = "mle")

pred_1 = predict(tb_viscour, node = "n", data = discrete_merge_water_viscous, method = "parents")
pred_2 = predict(tb_viscour, node = "n", data = discrete_merge_water_viscous[,-2], method = "parents")




#########################################################################################################
# Store nome of analyzed variables
# Flow rate	Inlet Temperature T1 	Inlet Temperature T2 			Inlet Pressure P1	Outlet Pressure P2	Shaft Torque
# TO DO : /
variables<-c("Q","Average.Inlet.Temp.Tm.i","Average.Outlet.Temp.Tm.o","Inlet.Pressure.P1","Outlet.Pressure.P2","RPM","Shaft.Torque","Inlet.Density.ρi","Inlet.Viscosity.mi","Outlet.Viscosity.mo","n","BHP","H")

# Sub-select collumns
subselect_merge_water_viscous<-na.omit(discrete_merge_water_viscous[,variables])

# Train bayesian network from discrete data 
colnames(subselect_merge_water_viscous)<-c("Q","Tm.i","Tm.o","P1","P2","RPM","T","pi","mi","mo","n","BHP","H")

trainning_features<-subselect_merge_water_viscous[which(subselect_merge_water_viscous$RPM!=3500),]
testing_features  <-subselect_merge_water_viscous[which(subselect_merge_water_viscous$RPM==3500),]

trainning_features<-subselect_merge_water_viscous[rownames(trainning_features),]
testing_features  <-subselect_merge_water_viscous[rownames(testing_features),]

tb_viscour <- tabu(trainning_features[,c("Q","Tm.i","Tm.o","P1","P2","T","pi","mi","mo","n","BHP","H")])

# Create bayesian networks
tb_viscour = bn.fit(tb_viscour, trainning_features[,c("Q","Tm.i","Tm.o","P1","P2","T","pi","mi","mo","n","BHP","H")])

pred_1 = predict(tb_viscour, node = "n", data = testing_features[,c("Q","Tm.i","Tm.o","P1","P2","T","pi","mi","mo","n","BHP","H")], method = "parents")

# Create the confusion matrix and get statistics
conf_matrix <- confusionMatrix(pred_1, testing_features$n)
