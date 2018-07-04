setwd("C:/Users/lb3_local/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("F:/OneDrive/sync/git/loubill/Domino/R/MTX")
# setwd("/media/louis/EXCHWINLIN/Gdrive/sync/git/loubill/Domino/R/MTX")
library(quanteda)

######import données
df.mtx<-read.csv2("data/mtx.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")
df.alt<-read.csv2("data/alt.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")

