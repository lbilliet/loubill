install.packages("devtools")#OK sur WIN YAF
library(devtools)
install.packages("curl")#OK sur WIN YAF
library(curl)
install_url("https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz")#OK sur WIN YAF
install_url("https://cran.r-project.org/bin/windows/contrib/3.6/slam_0.1-43.zip")#pb sur WIN YAF // OK sur 
install.packages("slam")
library(slam)#OK sur WIN YAF
install.packages("tm")
library(tm)#OK sur WIN YAF
install.packages("SnowballC")
library(SnowballC)#OK sur WIN YAF
install.packages("wordcloud")
library(wordcloud)#OK sur WIN YAF
install.packages("topicmodels")
library(topicmodels)#OK sur WIN YAF
install.packages("koRpus")
library("koRpus")#OK sur WIN YAF
install.packages("mclustcomp")
library(mclustcomp)#OK sur WIN YAF
install.packages("installr")
library(installr)#OK sur WIN YAF
installr::install.Rtools()#OK sur WIN YAF
install.packages("igraph")
library("igraph")#OK sur WIN YAF
install.packages("NLP")
library("NLP")#OK sur WIN YAF
install.packages("Matrix")
library("Matrix")#OK sur WIN YAF
install.packages("RNewsflow")
library("RNewsflow")#OK sur WIN YAF
install.packages("wordVectors")#pb sur WIN YAF car 3.5.1 et pas dispo // OK sur
devtools::install_github("bmschmidt/wordVectors")
library("wordVectors")#OK sur WIN YAF
install.packages("quanteda")
devtools::install_github("quanteda/quanteda.corpora")#OK sur WIN YAF
devtools::install_github("kbenoit/quanteda.dictionaries")#OK sur WIN YAF
devtools::install_github("quanteda/spacyr")#OK sur WIN YAF
devtools::install_github("quanteda/readtext")#OK sur WIN YAF
library(quanteda)#OK sur WIN YAF
install.packages("readtext")
library(readtext)#OK sur WIN YAF