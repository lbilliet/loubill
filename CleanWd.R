wd<-function (){
  rm(list = ls())
  chemRepTr <- getwd()
  resRchYafExt <- grep("local", chemRepTr, ignore.case = T)
  resRchYafInt <- grep("lb3", chemRepTr, ignore.case = T)
  resRchTourLin <- grep("/home/louis", chemRepTr, ignore.case = T)
  resRchTourWin <- grep("F:/", chemRepTr, ignore.case = T)
  
  if (any(resRchYafExt)) {
    setwd("C:/Users/lb3_local/OneDrive/sync/git/")
    chemRepTr
  } else if (any(resRchYafInt)) {
    setwd("C:/Users/lb3/OneDrive/sync/git/")
    chemRepTr
  } else if (any(resRchTourWin)) {
    setwd("F:/OneDrive/sync/git/")
    chemRepTr
  } else if (any(resRchTourLin)) {
    setwd("~/git/")
    chemRepTr
  }
  
  rm(list=ls())
  return(getwd())
}

Unaccent <- function(text) {
  text <- gsub("['`^~\": ]", "_", text)
  text <- gsub("[éèëê]", "e", text)
  text <- gsub("[àäâ]", "a", text)
  return(text)
}

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
