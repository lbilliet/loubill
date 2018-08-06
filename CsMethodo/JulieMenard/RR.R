rm(list = ls())
source("CleanWd.R")
wd()
setwd("loubill/CsMethodo/JulieMenard/")
library(readxl)
library(Epi)
library(dplyr)

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")

unaccent_Yann <- function (data) {
  library(stringr)
  if(is.vector(data)){
    vecTemp <- data
    vecTemp <- str_replace_all(vecTemp, "(\\.|\\?|,|#|\\(|\\))", " ")
    vecTemp <- trimws(vecTemp)
    # Retrait des caractères accentués
    with_accents <- c("Æ",  "Œ",  "æ",  "œ",  strsplit("ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÉÈÊËéèêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ","")[[1]])
    no_accents <-   c("Ae", "Oe", "ae", "oe", strsplit("AAAAAAaaaaaaOOOOOOooooooEEEEeeeeCcIIIIiiiiUUUUuuuuyNn","")[[1]])
    for(i in 1:length(with_accents)){
      vecTemp <- str_replace_all(vecTemp, with_accents[i], no_accents[i])
      # Transformation en minuscules
      vecTemp <- str_to_lower(vecTemp)
    }
  }
  if(is.data.frame(data)){
    dfTemp <- data
    dfTemp <- str_replace_all(dfTemp, "(\\.|\\?|,|#|\\(|\\))", " ")
    dfTemp <- trimws(dfTemp)
    # Retrait des caractères accentués
    with_accents <- c("Æ",  "Œ",  "æ",  "œ",  strsplit("ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÉÈÊËéèêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ","")[[1]])
    no_accents <-   c("Ae", "Oe", "ae", "oe", strsplit("AAAAAAaaaaaaOOOOOOooooooEEEEeeeeCcIIIIiiiiUUUUuuuuyNn","")[[1]])
    for(i in 1:length(with_accents)){
      dfTemp <- str_replace_all(dfTemp, with_accents[i], no_accents[i])
    }
  }
}

names(df) <- Unaccent(names(df))

# table(df$,df$,deparse.level=2,useNA="always")
# twoby2(1-df$,1-df$)


df$sup20T1 <- df$creat_1T/df$creat_avant_grossesse > 1.20
df$sup20T2 <- df$creat2T/df$creat_avant_grossesse > 1.20
df$sup20T3 <- df$creat3T/df$creat_avant_grossesse > 1.20

df$nonPathoT0 <- df$creat_avant_grossesse <= 133
df$pathoT1 <- df$creat_1T > 133
df$pathoT2 <- df$creat2T > 133
df$pathoT3 <- df$creat3T > 133

df$pathoT1 <- ifelse(is.na(df$pathoT1),FALSE, df$pathoT1)
df$pathoT2 <- ifelse(is.na(df$pathoT2),FALSE, df$pathoT2)
df$pathoT3 <- ifelse(is.na(df$pathoT3),FALSE, df$pathoT3)


if(df$nonPathoT0 == TRUE & (
  (!is.na(df$pathoT1) & df$pathoT1 == TRUE) |
  (!is.na(df$pathoT2) & df$pathoT2 == TRUE) |
  (!is.na(df$pathoT3) & df$pathoT3 == TRUE))){
  df$aggravation <- TRUE
}



bool <-
  df$creat_avant_grossesse <= 133 & (
    df$creat_1T >= 133 |
    df$creat2T >= 133 |
    df$creat3T >= 133 |
    ((df$creat_1T - df$creat_avant_grossesse) / df$creat_avant_grossesse) >  0.2 |
    ((df$creat2T - df$creat_avant_grossesse) / df$creat_avant_grossesse) >  0.2 |
    ((df$creat3T - df$creat_avant_grossesse) / df$creat_avant_grossesse) >  0.2
  )
  
bool

df$aggravation <- ifelse(bool, 1, 0)
df$aggravation

subCreat <-
  subset(df,
         select = c(creat_avant_grossesse, creat_1T, creat2T, creat3T, aggravation))
subCreat


table(subcreat$, df$, deparse.level = 2, useNA = "always")
twoby2(1 - df$, 1 - df$)
