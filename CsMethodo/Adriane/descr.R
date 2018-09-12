source("CleanWd.R")
wd()
rm(list = ls())
setwd("loubill/CsMethodo/Adriane/")
library(readxl)
library(lubridate)
unaccent <- function(text) {
  text <- gsub("['`^~\": /]", "_", text)
  text <- gsub("[éèëê]", "e", text)
  text <- gsub("[àäâ]", "a", text)
  return(text)
}

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")
names(df) <- unaccent(names(df))
names(df)
str(df)
as.character(df$Nom_de_la_mere)
# statsDescr <- summary(df, na.rm = T)
# statsDescr
# write.table(
#   statsDescr,
#   file = "stats/Stats descriptives tout venant.txt",
#   fileEncoding = "UTF-8",
#   dec = ",",
#   row.names = T,
#   col.names = T,
#   na = "NA"
# )

#stats descr numeric
vec_df_quanti<-sapply(df, function(x) is.numeric(x))
df_quanti<-df[,vec_df_quanti]
summary(df_quanti)
sd_quanti<-sapply(df_quanti, sd, na.rm = TRUE)
sd_quanti
var_quanti<-sapply(df_quanti, var, na.rm = TRUE)
var_quanti
# write.table(
#   descrQuanti,
#   file = "stats/Stats descriptives variables numériques.txt",
#   fileEncoding = "UTF-8",
#   dec = ",",
#   row.names = T,
#   col.names = T,
#   na = "NA"
# )

for (i in 1 : ncol(df)){
  print(table(df[,i]))
}

str(df)
vec_df_char<-sapply(df, function(x) is.character(x))
df_char<-df[,vec_df_char]

dev.off()
for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_diagrammeEffectifs.png", sep = ""), width = 1200, height = 750)
  plot(table(df_char[,j]), type="h",xlab=names(df_char[j]),ylab="Effectif")
  dev.off()
}

dev.off()
for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_diagrammeFréquences.png", sep = ""), width = 1200, height = 750)
  plot(prop.table(table(df_char[,j])),lwd=7,xlab=names(df_char[j]),ylab="Fréquence")
  dev.off()
}

for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_barresEffectifs.png", sep = ""), width = 1200, height = 750)
  barplot(table(df_char[,j]),xlab=names(df_char[j]),ylab="Effectif")
  dev.off()
}

for (j in 1: ncol(df_char)){
  png(paste("plot/loop/",names(df_char[j]),"_barresFréquences.png", sep = ""), width = 1200, height = 750)
  barplot(prop.table(table(df_char[,j])),xlab=names(df_char[j]),ylab="Fréquence")
  dev.off()
}

dev.off()
for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_camembert.png", sep = ""), width = 1200, height = 750)
  pie(table(df_char[,j]))
  dev.off()
}

########################non fournies encore
dev.off()
for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_histogramme.png", sep = ""), width = 1200, height = 750)
  hist(table(df_char[,j]), col = "grey")
  dev.off()
}

dev.off()
for (j in 1: ncol(df_char)){
  png(paste("plot/loop/", names(df_char[j]),"_boiteMoustache.png", sep = ""), width = 1200, height = 750)
  boxplot(table(df_char[,j]), col = "grey")
  dev.off()
}

dev.off()
df_factor<-df_char
for (j in 1: ncol(df_char)){
  df_factor[,j]<-as.factor(df_char[,j])
}

is.data.frame(df_char)
# df_factor[,2]<-as.factor(df_factor[,2])
factor(df_factor[,2])
df_factor[,2]<-factor(df_factor[,2])
df_factor[,2]
tortue<-df_factor[,2]
tortue<-as.vector(tortue)
tortue<-as.factor(tortue)

# #stats descr logical
# vec_df_logic<-sapply(df, function(x) is.logical(x))
# df_logic<-df[,vec_df_logic]
# descrLogic<-summary(df_logic)
# write.table(
#   descrLogic,
#   file = "stats/Stats descriptives variables binaires.txt",
#   fileEncoding = "UTF-8",
#   dec = ",",
#   row.names = T,
#   col.names = T,
#   na = "NA"
# )

# #stats descr date
# # is.date <- function(x) inherits(x, 'Date')
# vec_df_date<-sapply(df, function(x) is.date(x))
# df_date<-df[,vec_df_date]
# descrDate<-summary(df_date)
# write.table(
#   descrDate,
#   file = "stats/Stats descriptives variables dates.txt",
#   fileEncoding = "UTF-8",
#   dec = ",",
#   row.names = T,
#   col.names = T,
#   na = "NA"
# )


