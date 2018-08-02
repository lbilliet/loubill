---
title: "Plots"
author: "Louis Billiet"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, message = TRUE, Warning = TRUE)
```

```{r echo = FALSE}
nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")
subset_colclasses <- function(DF, colclasses="character") {
  DF[,sapply(DF, function(vec, test) class(vec) %in% test, test=colclasses)]
}
subsetCharacter<-subset_colclasses(df, "character")
```

```{r loop}
i<-NULL
for (i in 1: ncol(subsetCharacter)){
  eff<-table(subsetCharacter[,i])
  eff
  freq<-prop.table(table(subsetCharacter[,i]))
  freq
  diagEff<-plot(table(subsetCharacter[,i]), type="h",xlab=names(subsetCharacter[i]),ylab="Effectif")
  diagEff
  diagFreq<-plot(prop.table(table(subsetCharacter[,i])),lwd=7,xlab=names(subsetCharacter[i]),ylab="Fréquence")
  diagFreq
  barEff<-barplot(table(subsetCharacter[,i]),xlab=names(subsetCharacter[i]),ylab="Effectif")
  barEff
  barFreq<-barplot(prop.table(table(subsetCharacter[,i])),xlab=names(subsetCharacter[i]),ylab="Effectif")
  barFreq
  camemb<-pie(table(subsetCharacter[,i]))
  camemb
}

```


# Monthly Air Quality Graphs
```{r pressure,fig.width=6,echo=FALSE,message=FALSE,results="asis"}

i<-NULL
attach(subsetCharacter)
for (i in 1: ncol(subsetCharacter)){

  cat("  \n###",  subsetCharacter[i], "Air Quaility  \n")
  #print(plot(subsetCharacter[i,]))
  plot(subsetCharacter[i,])
  cat("  \n")

  eff<-table(subsetCharacter[,i])
  eff
  freq<-prop.table(table(subsetCharacter[,i]))
  freq
  diagEff<-plot(table(subsetCharacter[,i]), type="h",xlab=names(subsetCharacter[i]),ylab="Effectif")
  diagEff
  diagFreq<-plot(prop.table(table(subsetCharacter[,i])),lwd=7,xlab=names(subsetCharacter[i]),ylab="Fréquence")
  diagFreq
  barEff<-barplot(table(subsetCharacter[,i]),xlab=names(subsetCharacter[i]),ylab="Effectif")
  barEff
  barFreq<-barplot(prop.table(table(subsetCharacter[,i])),xlab=names(subsetCharacter[i]),ylab="Effectif")
  barFreq
  camemb<-pie(table(subsetCharacter[,i]))
  camemb
}

attach(subsetCharacter)
for(i in unique(Month)) {
  cat("  \n###",  month.name[i], "Air Quaility  \n")
  #print(plot(airquality[airquality$Month == i,]))
  plot(airquality[airquality$Month == i,])
  cat("  \n")
}
```