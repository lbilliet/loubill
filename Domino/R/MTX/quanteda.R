setwd("C:/Users/lb3_local/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("F:/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("/media/louis/EXCHWINLIN/Gdrive/sync/git/loubill/Domino/R/MTX")
library(tm)
library(quanteda)

######import données
####test 1 http://docs.quanteda.io/articles/quickstart.html
df.mtx<-read.csv("data/mtx.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")
txt.mtx<-NULL
i<-0
for (i in 1 : nrow(df.mtx)){
  txt.mtx<-paste0(df.mtx, df.mtx[i,])
}
corpus.1.mtx<-corpus(txt.mtx)
summary(corpus.mtx)
dfm.mtx<-dfm(corpus.mtx, tolower=TRUE, stem = FALSE)
###test 2 http://docs.quanteda.io/articles/quickstart.html
vec.mtx<-readtext::readtext("data/mtx.csv", encoding = "UTF8", quote = "")
corpus.2.mtx<-corpus(vec.mtx)
summary(corpus.1.mtx)
summary(corpus.2.mtx)


# df.alt<-read.csv2("data/alt.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")
corpus.alt<-corpus(df.alt$V1)
vec.alt<-readtext::readtext("data/alt.csv")
dfm.alt<-dfm(corpus.alt, tolower=TRUE, stem = FALSE)

textstat_simil(dfm.mtx, margin = "documents")

