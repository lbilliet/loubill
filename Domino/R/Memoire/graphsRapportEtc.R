source("CleanWd.R")
wd()
setwd("loubill/Domino/R/Memoire/")
library(ggplot2)

df_longueur<-read.csv(file = "contentLength.csv", header = T, sep = "\t")
df_date<-read.csv(file = "dateCreated.csv", header = T, sep = "\t")

