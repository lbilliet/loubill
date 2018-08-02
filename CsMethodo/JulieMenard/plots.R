source("CleanWd.R")
wd()
rm(list = ls())
setwd("loubill/CsMethodo/JulieMenard/")
library(readxl)
library(ggplot2)
library(knitr)

nomFichier <- "data/Classeur.xls"
df <- read_xls(nomFichier, col_names = T, na = "")

subset_colclasses <- function(DF, colclasses = "character") {
  DF[, sapply(DF, function(vec, test)
    class(vec) %in% test, test = colclasses)]
}

subsetCharacter <- subset_colclasses(df, "character")


p1 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$ID)) + geom_bar() + xlab(names(subsetCharacter[1])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p2 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$ethnie)) + geom_bar() + xlab(names(subsetCharacter[2])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p3 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$contraception)) + geom_bar() + xlab(names(subsetCharacter[3])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p4 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`pathologie réle`)) + geom_bar() + xlab(names(subsetCharacter[4])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p5 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$SAPL)) + geom_bar() + xlab(names(subsetCharacter[5])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p6 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`diabète gesta`)) + geom_bar() + xlab(names(subsetCharacter[6])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p7 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`rapport sflt1/PLGF`)) + geom_bar() + xlab(names(subsetCharacter[7])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p8 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`biopsie réle pendant grossesse`)) + geom_bar() + xlab(names(subsetCharacter[8])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 15,
    colour = "black",
    size = 8
  ))
p9 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`Ac anti-HLA post partum`)) + geom_bar() + xlab(names(subsetCharacter[9])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 15,
    colour = "black",
    size = 12
  ))
p10 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`délai 1 an sans rejet`)) + geom_bar() + xlab(names(subsetCharacter[10])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p11 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`nouveau né`)) + geom_bar() + xlab(names(subsetCharacter[11])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p12 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`voie accouchement`)) + geom_bar() + xlab(names(subsetCharacter[12])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))
p13 <-
  ggplot(data = subsetCharacter, aes(subsetCharacter$`apath placentaire`)) + geom_bar() + xlab(names(subsetCharacter[13])) + ylab("Effectifs") + theme(axis.text.x = element_text(
    angle = 45,
    colour = "black",
    size = 8
  ))


p1
p2
p3
p4
p5
p6
p7
p8
p9
p10
p11
p12
