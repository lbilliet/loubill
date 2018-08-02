source("CleanWd.R")
wd()
rm(list = ls())
getwd()
setwd("loubill/CsMethodo/JulieMenard/")
library(readxl)
library(broom)
library(knitr)

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")

subset_colclasses <- function(DF, colclasses="character") {
  DF[,sapply(DF, function(vec, test) class(vec) %in% test, test=colclasses)]
}

subsetCharacter<-subset_colclasses(df, "character")

# dev.off()
# j<-NULL
# for (j in 1: ncol(subsetCharacter)){
#   write.table(tidy(print(table(subsetCharacter[,j]))), file = paste("stats/", names(subsetCharacter[j]),"_Effectifs.csv", sep = ""), append = TRUE, sep = "\t", fileEncoding = "UTF-8",col.names = T, row.names = T )
# }
# 
# dev.off()
# j<-NULL
# for (j in 1: ncol(subsetCharacter)){
#   tidy<-tidy(prop.table(table(subsetCharacter[,j])))
#   write.table(tidy, file = paste("stats/", names(subsetCharacter[j]),"_Fréquences.csv", sep = ""), append = TRUE, sep = "\t", fileEncoding = "UTF-8",col.names = T, row.names = T )
# }

#   for (i in 1: ncol(subsetCharacter)){
# 
#     table(subsetCharacter[,i])# à return en print write.csv après être passé en df
#     prop.table(table(subsetCharacter[,i]))
#     
#     png(paste("plot/loop/plot","diagEff", names(subsetCharacter[i]),".png", sep = ""), width = 1200, height = 750)
#     plot(table(subsetCharacter[,i]), type="h",xlab=names(subsetCharacter[i]),ylab="Effectif")
#     dev.off()
#     
#     png(paste("plot/loop/plot","diagFreq", names(subsetCharacter[i]),".png", sep = ""), width = 1200, height = 750)
#     plot(prop.table(table(subsetCharacter[,i])),lwd=7,xlab=names(subsetCharacter[i]),ylab="Fréquence")
#     dev.off()
#     
#     png(paste("plot/loop/plot","barEff", names(subsetCharacter[i]),".png", sep = ""), width = 1200, height = 750)
#     barplot(table(subsetCharacter[,i]),xlab=names(subsetCharacter[i]),ylab="Effectif")
#     dev.off()
#     
#     png(paste("plot/loop/plot","barFreq", names(subsetCharacter[i]),".png", sep = ""), width = 1200, height = 750)
#     barplot(prop.table(table(subsetCharacter[,i])),xlab=names(subsetCharacter[i]),ylab="Fréquence")
#     dev.off()
#     
#     png(paste("plot/loop/plot","camemb", names(subsetCharacter[i]),".png", sep = ""), width = 1200, height = 750)
#     pie(table(subsetCharacter[,i]))
#     dev.off()
#   }

vec


names(subsetCharacter) <- sub(" ", "_", names(subsetCharacter))
names(subsetCharacter) <- sub("/", "_", names(subsetCharacter))

dev.off()
j<-NULL
for (j in 1: ncol(subsetCharacter)){
  png(paste("plot/loop/", names(subsetCharacter[j]),"_diagrammeEffectifs.png", sep = ""), width = 1200, height = 750)
  plot(table(subsetCharacter[,j]), type="h",xlab=names(subsetCharacter[j]),ylab="Effectif")
  dev.off()
}

dev.off()
j<-NULL
for (j in 1: ncol(subsetCharacter)){
  png(paste("plot/loop/", names(subsetCharacter[j]),"_diagrammeFréquences.png", sep = ""), width = 1200, height = 750)
  plot(prop.table(table(subsetCharacter[,j])),lwd=7,xlab=names(subsetCharacter[j]),ylab="Fréquence")
  dev.off()
}

j<-NULL
for (j in 1: ncol(subsetCharacter)){
  png(paste("plot/loop/", names(subsetCharacter[j]),"_barresEffectifs.png", sep = ""), width = 1200, height = 750)
  barplot(table(subsetCharacter[,j]),xlab=names(subsetCharacter[j]),ylab="Effectif")
  dev.off()
}

j<-NULL
for (j in 1: ncol(subsetCharacter)){
  png(paste("plot/loop/",names(subsetCharacter[j]),"_barresFréquences.png", sep = ""), width = 1200, height = 750)
  barplot(prop.table(table(subsetCharacter[,j])),xlab=names(subsetCharacter[j]),ylab="Fréquence")
  dev.off()
}

j<-NULL
for (j in 1: ncol(subsetCharacter)){
  png(paste("plot/loop/", names(subsetCharacter[j]),"_camembert.png", sep = ""), width = 1200, height = 750)
  pie(table(subsetCharacter[,j]))
  dev.off()
}

