######préparation packages, wd, etc
setwd("C:/Users/lb3/OneDrive/sync/git/loubill/Domino/R/Domino/MTX")
#install.packages("devtools")
# devtools::install_github("lbilliet/loubill")
# slam_url <- "https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz"
# install_url(slam_url)
# urlSlam <- "https://cran.r-project.org/bin/windows/contrib/3.6/slam_0.1-43.zip"
# install_url(urlSlam)
# install.packages('installr')
# installr::install.Rtools()
# install_github("bmschmidt/wordVectors")
#install.packages("RNewsflow")
#devtools::install_github("bmschmidt/wordVectors")
#install.packages(c('tm', 'SnowballC', 'wordcloud', 'topicmodels'))
library(devtools)
library(tm)
library(SnowballC)
library(wordcloud)
library(topicmodels)
library("koRpus")
library("wordVectors")
library("RNewsflow")

######import données
df.mtx<-read.csv2("data/mtx.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")
df.alt<-read.csv2("data/alt.csv", sep = "\n" ,header=F, quote = "", stringsAsFactors = F, fileEncoding = "UTF8")

######conversion encodage suppression caractère speciaux
#définition fonctio suppression char speciaux
Unaccent <- function(text) {
  text <- gsub("['`^~\"]", " ", text)
  text <- iconv(text, to="ASCII//TRANSLIT//IGNORE")
  text <- gsub("['`^~\"]", "", text)
  return(text)
}
###application fonction suppr char speciaux
df.mtx.unaccent<-Unaccent(df.mtx)
df.alt.unaccent<-Unaccent(df.alt)

#constitution corpus
corpus.mtx = Corpus(VectorSource(df.mtx.unaccent))
corpus.alt = Corpus(VectorSource(df.alt.unaccent))

#####préparation texte
#retirer ponctuation
corpus.mtx<-tm_map(corpus.mtx, removePunctuation)
corpus.alt<-tm_map(corpus.alt, removePunctuation)
#retirer stopwords
corpus.mtx <- tm_map(corpus.mtx, removeWords, stopwords("french"))
corpus.alt <- tm_map(corpus.alt, removeWords, stopwords("french"))
#stemmatiser
corpus.mtx <- tm_map(corpus.mtx, stemDocument)
corpus.alt <- tm_map(corpus.alt, stemDocument)

#######consitution matrice documents
#matrice frequence termes
tdm.mtx <- TermDocumentMatrix(corpus.mtx)
tdm.alt <- TermDocumentMatrix(corpus.alt)
inspect(tdm.mtx)
inspect(tdm.alt)
#matrice frequence documents
dtm.mtx <- DocumentTermMatrix(corpus.mtx, control = list(weighting = weightTfIdf, stopwords = TRUE))
inspect(dtm.mtx)
dtm.alt <- DocumentTermMatrix(corpus.alt, control = list(weighting = weightTfIdf, stopwords = TRUE))
inspect(dtm.alt)

######documents.compare
documents.compare(dtm.alt, dtm.mtx, measure = "cosine", min.similarity = 0, n.topsim = NULL, return.zeros = FALSE)
