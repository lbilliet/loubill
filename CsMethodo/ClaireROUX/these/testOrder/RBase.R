setwd("C:/Users/lb3/OneDrive/Internat/R/Cs_methodo/Claire_ROUX/these/testOrder")
install.packages("lubridate")
install.packages("readr")
install.packages("magrittr")
install.packages("readxl")
install.packages("lattice")
library("lubridate")
library("magrittr")
library("readr")
library("readxl")
library("lattice")

##############OBJECTIF 2
RallChrono <- read_excel("../all/sources/RallChrono.xls")
RallChrono$date_cs<-as.Date(RallChrono$date_cs, format = "%Y-%m-%d")
RallChrono
SS<-subset(RallChrono, type_nutr=='SS')
SS
CNO<-subset(RallChrono, type_nutr=='CNO')
CNO
NE<-subset(RallChrono, type_nutr=='NE')
NE

zInf0<-subset(RallChrono, z_score<0)
zInf0
zSup0<-subset(RallChrono, z_score>=0)
zSup0
SSZInf0<-subset(zInf0, type_nutr=='SS')
SSZInf0
CNOZInf0<-subset(zInf0, type_nutr=='CNO')
CNOZInf0
NEZInf0<-subset(zInf0, type_nutr=='NE')
NEZInf0
SSZSup0<-subset(zSup0, type_nutr=='SS')
SSZSup0
CNOZSup0<-subset(zSup0, type_nutr=='CNO')
CNOZSup0
NEZSup0<-subset(zSup0, type_nutr=='NE')
NEZSup0

# SSobj2 <- read_excel("../all/sources/SSall.xls")
# SSobj2
# CNOobj2 <- read_excel("../all/sources/CNOall.xls")
# CNOobj2
# NEobj2 <- read_excel("../all/sources/NEall.xls")
# NEobj2

### tous
summary(RallChrono)
length(na.omit(RallChrono$kCal_kg_j_TA))
length(na.omit(RallChrono$Lip_Pct_TA))
length(na.omit(RallChrono$Prot_Pct_TA))
length(na.omit(RallChrono$Glc_Pct_TA))
length(na.omit(RallChrono$Pct_AET_reco))
length(na.omit(RallChrono$z_score))

### groupe SS
summary(SS)
length(na.omit(SS$kCal_kg_j_TA))
length(na.omit(SS$Lip_Pct_TA))
length(na.omit(SS$Prot_Pct_TA))
length(na.omit(SS$Glc_Pct_TA))
length(na.omit(SS$Pct_AET_reco))
length(na.omit(SS$z_score))

### groupe CNO
summary(CNO)
length(na.omit(CNO$kCal_kg_j_TA))
length(na.omit(CNO$Lip_Pct_TA))
length(na.omit(CNO$Prot_Pct_TA))
length(na.omit(CNO$Glc_Pct_TA))
length(na.omit(CNO$Pct_AET_reco))
length(na.omit(CNO$z_score))

### groupe NE
summary(NE)
length(na.omit(NE$kCal_kg_j_TA))
length(na.omit(NE$Lip_Pct_TA))
length(na.omit(NE$Prot_Pct_TA))
length(na.omit(NE$Glc_Pct_TA))
length(na.omit(NE$Pct_AET_reco))
length(na.omit(NE$z_score))

####### anova
aov_aet<-aov(kCal_kg_j_TA~type_nutr, data = RallChrono)
aov_aet
summary(aov_aet)

aov_prot<-aov(Prot_Pct_TA~type_nutr, data = RallChrono)
aov_prot
summary(aov_prot)

aov_gluc<-aov(Glc_Pct_TA~type_nutr, data = RallChrono)
aov_gluc
summary(aov_gluc)

aov_lip<-aov(Lip_Pct_TA~type_nutr, data = RallChrono)
aov_lip
summary(aov_lip)

aov_pct_aer<-aov(Pct_AET_reco~type_nutr, data = RallChrono)
aov_pct_aer
summary(aov_pct_aer)

aov_z<-aov(z_score~type_nutr, data = RallChrono)
aov_z
summary(aov_z)


##############OBJECTIF 3

############# groupe SS

length(na.omit(SS$z_score))
spagplotSS<-xyplot(z_score~date_cs, data=SS, groups=initiales, type="l", 
                 main="Evolution du Z-Score IMC au cours du temps dans le groupe sans suppl?mentation 
                 (n=16 observations)",
                 xlab="Date de consultation",
                 ylab="Z-Score")
print(spagplotSS)
# SSZscore1 <- read_excel("../all/obj3/SSZscore.xls", 
#                        sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
# View(SSZscore1)
# moySS1<-mean(SSZscore1$z_score)
# SSZscore2 <- read_excel("../all/obj3/SSZscore.xls", 
#                        sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
# #View(SSZscore2)
# moySS2<-mean(SSZscore2$z_score)
# wilcox.test(SSZscore1$z_score, SSZscore2$z_score, paired=TRUE)



############# groupe NE
length(na.omit(NE$z_score))
spagplotNE<-xyplot(z_score~date_cs, data=NE, groups=initiales, type="l", 
                 main="Evolution du Z-Score IMC au cours du temps dans le groupe avec nutrition ent?rale
                 (n=22 observations)",
                 xlab="Date de consultation",
                 ylab="Z-Score")
print(spagplotNE)
# NEZscore1 <- read_excel("../all/obj3/NEZscore.xls", 
#                        sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
# #View(NEZscore1)
# NEZscore2 <- read_excel("../all/obj3/NEZscore.xls", 
#                         sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
# #View(NEZscore2)
# moyNE1<-mean(NEZscore1$z_score)
# moyNE2<-mean(NEZscore2$z_score)
# shapiro.test(NEZscore1$z_score) ### ici distribution normale car pvalue non signif
# qqnorm(NEZscore1$z_score)
# shapiro.test(NEZscore2$z_score) ### ici distribution normale car pvalue non signif
# qqnorm(NEZscore2$z_score)
# t.test(moyNE1, moyNE2, paired=TRUE)
# wilcox.test(NEZscore1$z_score, NEZscore2$z_score, paired=TRUE)





############# groupe CNO
length(na.omit(CNO$z_score))
spagplotCNO<-xyplot(z_score~date_cs, data=CNO, groups=initiales, type="l", 
                 main="Evolution du Z-Score IMC au cours du temps dans le groupe avec suppl?mentation orale
                 (n=61 observations)",
                 xlab="Date de consultation",
                 ylab="Z-Score")
print(spagplotCNO)

CNOZscore1 <- read_excel("../all/obj3/CNOZscore.xls", 
                        sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
#View(CNOZscore1)
moyCNO1<-mean(CNOZscore1$z_score)
CNOZscore2 <- read_excel("../all/obj3/CNOZscore.xls", 
                         sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
#View(CNOZscore2)
moyCNO2<-mean(CNOZscore2$z_score)
t.test(moyCNO1, moyCNO2, paired=TRUE)
wilcox.exact(CNOZscore1$z_score, CNOZscore2$z_score, paired=TRUE, exact=NULL)
#### voire pour télécharger package pour fonction wilcox.exact
