library("lubridate")
library("magrittr")
library(readr)
library(readxl)
##############OBJECTIF 2
SSobj2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj2/SSall.xls")
View(SSobj2)
CNOobj2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj2/CNOall.xls")
View(CNOobj2)
NEobj2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj2/NEall.xls")
View(NEobj2)

####DFZScore<-data.frame(SSobj2$z_score, CNOobj2$z_score, NEobj2$z_score, check.rows = FALSE, fix.empty.names = FALSE)
######DFZScore<-data.frame(matrix(NA, ncol = 3, nrow = length(CNOobj2$z_score), dimnames = list(unique(SSobj2$z_score), unique(CNOobj2$z_score), unique(NEobj2$z_score))))
####DFZScore<-data.frame(SSZscore = numeric(0), CNOZscore = numeric(0), NEZscore = numeric(0))
#####DFZScore$SSZscore[1:25]<-SSobj2$z_score
#####DFzScore<-cbind(DFzScore,SSobj2$z_score)

SSZ2<-SSobj2$z_score
CNOZ2<-CNOobj2$z_score
NEZ2<-NEobj2$z_score
length(SSZ2)=length(CNOZ2)=length(NEZ2)
DFZ<-cbind(SSZ2, CNOZ2, NEZ2)
View(DFZ)
ANOVAZ<-aov(SSZ2, DFZ)

##### groupe SS
moySSZobj2<-mean(SSobj2$z_score, na.rm = TRUE)
moySSZobj2
moySSAETobj2<-mean(SSobj2$'kCal/kg/j_TA', na.rm = TRUE)
moySSAetobj2
moySSPctLpdobj2<-mean(SSobj2$Lip_Pct_TA, na.rm = TRUE)
moySSPctLpdobj2
moySSPctProtdobj2<-mean(SSobj2$Prot_Pct_TA, na.rm = TRUE)
moySSPctProtdobj2
moySSPctGLucdobj2<-mean(SSobj2$Glc_Pct_TA, na.rm = TRUE)
moySSPctGLucdobj2
moySSPctPctAETobj2<-mean(SSobj2$Pct_AET_reco, na.rm = TRUE)
moySSPctPctAETobj2
anov1<-aov(z_score)


##### groupe CNO
moyCNOZobj2<-mean(CNOobj2$z_score, na.rm = TRUE)
moyCNOZobj2
moyCNOAETobj2<-mean(CNOobj2$'kCal/kg/j_TA', na.rm = TRUE)
moyCNOAetobj2
moyCNOPctLpdobj2<-mean(CNOobj2$Lip_Pct_TA, na.rm = TRUE)
moyCNOPctLpdobj2
moyCNOPctProtdobj2<-mean(CNOobj2$Prot_Pct_TA, na.rm = TRUE)
moyCNOPctProtdobj2
moyCNOPctGLucdobj2<-mean(CNOobj2$Glc_Pct_TA, na.rm = TRUE)
moyCNOPctGLucdobj2
moyCNOPctPctAETobj2<-mean(CNOobj2$Pct_AET_reco, na.rm = TRUE)
moyCNOPctPctAETobj2

##### groupe NE
moyNEZobj2<-mean(NEobj2$z_score, na.rm = TRUE)
moyNEZobj2
moyNEAETobj2<-mean(NEobj2$'kCal/kg/j_TA', na.rm = TRUE)
moyNEAetobj2
moyNEPctLpdobj2<-mean(NEobj2$Lip_Pct_TA, na.rm = TRUE)
moyNEPctLpdobj2
moyNEPctProtdobj2<-mean(NEobj2$Prot_Pct_TA, na.rm = TRUE)
moyNEPctProtdobj2
moyNEPctGLucdobj2<-mean(NEobj2$Glc_Pct_TA, na.rm = TRUE)
moyNEPctGLucdobj2
moyNEPctPctAETobj2<-mean(NEobj2$Pct_AET_reco, na.rm = TRUE)
moyNEPctPctAETobj2

##############OBJECTIF 3
############# groupe SS
SSZscore1 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/SSZscore.xls", 
                       sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
#View(SSZscore1)
moySS1<-mean(SSZscore1$z_score)
SSZscore2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/SSZscore.xls", 
                       sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
#View(SSZscore2)
moySS2<-mean(SSZscore2$z_score)
wilcox.test(SSZscore1$z_score, SSZscore2$z_score, paired=TRUE)




############# groupe NE
NEZscore1 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/NEZscore.xls", 
                       sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
#View(NEZscore1)
NEZscore2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/NEZscore.xls", 
                        sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
#View(NEZscore2)
moyNE1<-mean(NEZscore1$z_score)
moyNE2<-mean(NEZscore2$z_score)
shapiro.test(NEZscore1$z_score) ### ici distribution normale car pvalue non signif
qqnorm(NEZscore1$z_score)
shapiro.test(NEZscore2$z_score) ### ici distribution normale car pvalue non signif
qqnorm(NEZscore2$z_score)
t.test(moyNE1, moyNE2, paired=TRUE)
wilcox.test(NEZscore1$z_score, NEZscore2$z_score, paired=TRUE)





############# groupe CNO
CNOZscore1 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/CNOZscore.xls", 
                        sheet = "1", col_types = c("text", "skip", "numeric", "skip"))
#View(CNOZscore1)
moyCNO1<-mean(CNOZscore1$z_score)
CNOZscore2 <- read_excel("E:/Lou/Google Drive/médecine/INTERNAT/Cs méthodo/Claire Roux - vems IgG muco/R/thèse/all/obj3/CNOZscore.xls", 
                         sheet = "2", col_types = c("text", "skip", "numeric", "skip"))
#View(CNOZscore2)
moyCNO2<-mean(CNOZscore2$z_score)
t.test(moyCNO1, moyCNO2, paired=TRUE)
wilcox.test(CNOZscore1$z_score, CNOZscore2$z_score, paired=TRUE)
