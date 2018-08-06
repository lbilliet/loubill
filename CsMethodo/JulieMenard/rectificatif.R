source("CleanWd.R")
wd()
rm(list = ls())
setwd("loubill/CsMethodo/JulieMenard/")
library(readxl)
library(broom)
library(ggplot2)
library(knitr)

unaccent <- function(text) {
  text <- gsub("['`^~\": /]", "_", text)
  text <- gsub("[éèëê]", "e", text)
  text <- gsub("[àäâ]", "a", text)
  return(text)
}

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")
names(df) <- unaccent(names(df))

sub <-subset(df, select = c(ID, poids, terme, nouveau_ne, nombre_de_fœtus), df$nombre_de_fœtus <= 1 & df$nouveau_ne != "E" & df$nouveau_ne != "D" & df$nouveau_ne != "B")

statsTermePoids <- summary(sub, na.rm = T)
statsTermePoids
write.table(
  statsTermePoids,
  file = "stats/Stats exclusion jumeaux, IMG précoce, IVG & FCSP.txt",
  fileEncoding = "UTF-8",
  dec = ",",
  row.names = T,
  col.names = T,
  na = "NA"
)

vec_df_quanti<-sapply(df, function(x) is.numeric(x))
vec_sub_quanti<-sapply(sub, function(x) is.numeric(x))
df_quanti<-df[,vec_df_quanti]
sub_quanti<-sub[,vec_sub_quanti]

var(df_quanti, na.rm = T)
sd(df_quanti, na.rm = T)
var(sub_quanti, na.rm = T)
sd(sub_quanti, na.rm = T)

####variances
#tout venant
for (i in 1 : ncol(df_quanti)){
  print(var(df_quanti[,i], na.rm = T))
}
#subset exclusion IVG etc
for (i in 1 : ncol(sub_quanti)){
  print(var(sub_quanti[,i], na.rm = T))
}

##### déviations standard
#tout venant
for (i in 1 : ncol(df_quanti)){
  print(sqrt(var(df_quanti[,i], na.rm = T)))
}
#subset exclusion IVG etc
for (i in 1 : ncol(sub_quanti)){
  print(sqrt(var(sub_quanti[,i], na.rm = T)))
}
