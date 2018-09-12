read.csv(...)
data
data[order(data$identité, data$fdatevisite),]
identite <- c("id1", "id2")
identtite <- levels(data$identite)
levels(data$identite)
data[,c("patient","dateV1...")]

ldply#à favoriser
lapply(identite, function(i){ 
  data[data$patient == i,]
  
  data$efs24[data$patient == "id1" &  data$date == min(data$...)]
  })
data[data$patient == "id1",]

data$efs24[data$patient == "id1" &  data$date == min(data$...)]

