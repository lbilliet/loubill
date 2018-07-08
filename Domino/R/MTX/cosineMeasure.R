setwd("C:/Users/lb3_local/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("F:/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("/media/louis/EXCHWINLIN/Gdrive/sync/git/loubill/Domino/R/MTX")
library(tm)
library(quanteda)

######import données

#données méthotrexate
vec.mtx<-scan(file = "data/mtx.csv", sep="\t", what = character(), quote = "")
head(vec.mtx)
summary(vec.mtx)#pourquoi 50 ici ?

#données allaitement (une des dontre-indications)
vec.alt<-scan(file = "data/alt.csv", sep="\t", what = character(), quote = "")
head(vec.alt)
summary(vec.alt)#pourquoi 100 ici ?

#####concaténation pour constitution bag of words

#bag of words mtx
result <- NULL
i<-0
bow.mtx <- ''
for (i in 1 : length(vec.mtx)){
      result <- paste0(result, vec.mtx[i])
  bow.mtx<- result
}
head(bow.mtx)

#bag of words alt
result <- NULL
i<-0
bow.alt <- ''
for (i in 1 : length(vec.alt)){
  result <- paste0(result, vec.alt[i])
  bow.alt<- result
}
head(bow.alt)

#### construction vecteur comme corpus des documents
vec.mtx<-c(bow.mtx,bow.alt)

#####construction DFM
dfm.mtx<-dfm(vec.mtx, remove_punct=TRUE, remove_numbers = TRUE, tolower = TRUE, verbose = TRUE)
dfm.mtx

####cosine sim
dist<-textstat_simil(dfm.mtx, margin="documents", method="cosine")
head(dist)
print(dist)
as.data.frame(as.matrix(dist))