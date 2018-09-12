install.packages(c("lubridate", "magrittr"))
library("lubridate")
library("magrittr")
library(readr)
library(readr)
Rall <- read_csv("C:/Users/fly_r/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/Rall.csv", 
                 col_types = cols(`Date  Cs` = col_date(format = "%d/%m/%y")), 
                 locale = locale(decimal_mark = ","))
View(Rall)
Rall

names(Rall)[3]<-"date_cs" 
names(Rall)[9]<-"z_score"
dataChrono <- Rall[order(Rall$Initiales, Rall$date_cs),]

#pour objectif 1
dataChrono <- subset(dataChrono, !is.na(dataChrono$z_score))
df <- dataChrono[1,]
for (i in 1 : nrow(dataChrono)) { 
  if(i!=nrow(dataChrono)){
  row1 <- dataChrono[i,]
  row2 <- dataChrono[i+1,]
  init1 <- row1$Initiales
  init2 <- row2$Initiales
  print(init1)
  print(init2)
  if(init1 != init2){
    df <- rbind(df, row2)
  }
  }
}
#pour obejctif 3 1ère étape constitution dataframe ligne terminale à adapter avec datasets adaptés selon les objectfis
names(Rall)[11]<-"prot_g_j_aej"
dataChrono <- Rall[order(Rall$Initiales, Rall$date_cs),]
obj3NA <- subset(dataChrono, !is.na(dataChrono$prot_g_j_aej))

dfobj3 <- obj3NA[nrow(obj3NA),]

for (i in 1 : nrow(obj3NA)) {
  if(i!=nrow(obj3NA)){
    row1 <- obj3NA[i,]
    row2 <- obj3NA[i+1,]
    init1 <- row1$Initiales
    init2 <- row2$Initiales
    print(init1)
    print(init2)
    if(init1 != init2){
      dfobj3 <- rbind(dfobj3, row1)
    }
  }
}
####trims pour virer caractère vides ou espaces etc

###############~merger les tableaux
testMerg <- rbind(df,dfobj3)
