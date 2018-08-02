source("CleanWd.R")
wd()
rm(list = ls())
setwd("loubill/CsMethodo/JulieMenard/")
library(readxl)
library(broom)
library(ggplot2)
library(knitr)

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")
df

statsDescrNoNA <- summary(df, na.rm = T)
statsDescrNoNA
write.table(
  statsDescrNoNA,
  file = "Stats descriptives.txt",
  fileEncoding = "UTF-8",
  dec = ",",
  row.names = T,
  col.names = T,
  na = "NA"
)

sink("stats.txt")
print(statsDescrNoNA)
sink()

write.csv( tidy( statsDescrNoNA ) , "coefs.csv")
dfStats<-read.csv("coefs.csv")
subsetDfStats<-subset(dfStats, select=c(Var2, n))
View(subsetDfStats)
subsetNoNADfStats<-subset(subsetDfStats, !is.na(n))
View(subsetNoNADfStats)
write.csv( subsetNoNADfStats, "stats.csv", fileEncoding = "UTF-8")

subset_colclasses <- function(DF, colclasses="character") {
  DF[,sapply(DF, function(vec, test) class(vec) %in% test, test=colclasses)]
}

subsetCharacter<-subset_colclasses(df, "character")
str(subsetCharacter)

doHist<- function(df){
  hist1<-hist(nchar(df[,1]), xlab = names(df[1]), ylab = "Effectifs cumulés")
  hist2<-hist(nchar(df[,2]), xlab = names(df[2]), ylab = "Effectifs cumulés")
  hist3<-hist(nchar(df[,3]), xlab = names(df[3]), ylab = "Effectifs cumulés")
  hist4<-hist(nchar(df[,4]), xlab = names(df[4]), ylab = "Effectifs cumulés")
  hist5<-hist(nchar(df[,5]), xlab = names(df[5]), ylab = "Effectifs cumulés")
  hist6<-hist(nchar(df[,6]), xlab = names(df[6]), ylab = "Effectifs cumulés")
  hist7<-hist(nchar(df[,7]), xlab = names(df[7]), ylab = "Effectifs cumulés")
  hist8<-hist(nchar(df[,8]), xlab = names(df[8]), ylab = "Effectifs cumulés")
  hist9<-hist(nchar(df[,9]), xlab = names(df[9]), ylab = "Effectifs cumulés")
}



# subsetCharacter[] <- lapply( subsetCharacter, factor)
# 
# i<-NULL
# for (i in 1 : 3){
#   paste("a", i, sep="")
# }
# i<-NULL

i<-NULL
for (i in 1 : ncol(subsetCharacter)){
  # paste("eff", i, sep="")
  eval(parse(text=paste0("eff",i,"=rep(0, ncol(subsetCharacter))")))
  eval(parse(text=paste0("freq",i,"=rep(0, ncol(subsetCharacter))")))
  eval(parse(text=paste0("diagEff",i,"=rep(0, ncol(subsetCharacter))")))
  eval(parse(text=paste0("diagFreq",i,"=rep(0, ncol(subsetCharacter))")))
  eval(parse(text=paste0("barEff",i,"=rep(0, ncol(subsetCharacter))")))
  eval(parse(text=paste0("camemb",i,"=rep(0, ncol(subsetCharacter))")))
  # assign(paste("var",i,sep=""), rep(0, ncol(subsetCharacter)))<-table(subsetCharacter[,1])
}
i<-NULL


paste("eff", i, sep="")<-table(subsetCharacter[,i])
paste("freq", i, sep="")<-prop.table(table(subsetCharacter[,i]))
diagEff<-plot(table(subsetCharacter[,i]), type="h",xlab=names(subsetCharacter[1]),ylab="Effectif")
diagFreq<-plot(prop.table(table(subsetCharacter[,i])),lwd=7,xlab=names(subsetCharacter[1]),ylab="Fr?quence")
barEff<-barplot(table(subsetCharacter[,i]),xlab=names(subsetCharacter[1]),ylab="Effectif")
barFreq<-barplot(prop.table(table(subsetCharacter[,i])),xlab=names(subsetCharacter[1]),ylab="Effectif")
camemb<-pie(table(subsetCharacter[,i]))

essai <- spin("graphknit.R", knit = FALSE)
knit2html(essai)


sink(file="statsClasses.txt", append = T)
print(eff)
print(freq)
# print(diagEff)
# print(diagFreq)
# print(barEff)
# print(barFreq)
# print(camemb)
sink()

sink(file="statsClasses.txt", append = T)
print(table(subsetCharacter$ID))
print(prop.table(table(subsetCharacter$ID)))
sink()
