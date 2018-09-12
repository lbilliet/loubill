setwd("F:/OneDrive/sync/medecine/R/Cs_methodo/Alice_BOULANGER/these")
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
theseAlice <- read_excel("../theseLATA3.xlsx")
theseAlice$Date<-as.Date(theseAlice$Date, format = "%d.%m.%Y")
summary(theseAlice, na)

#subset conformité
cf1<-subset(theseAlice, theseAlice$Antecedents=='Oui')
cf2<-subset(cf1, cf1$Traitements=='Oui')
cf3<-subset(cf2, cf2$Autonomie=='Oui')
cf4<-subset(cf3, cf3$Confiance=='Oui')
cf5<-subset(cf4, cf4$Directives=='Oui')
cf6<-subset(cf5, cf5$Ressources=='Oui')
cf7<-subset(cf6, cf6$Paramed=='Oui')
cf8<-subset(cf7, cf7$Tracabilite=='Oui')
cf9<-subset(cf8, cf8$Antecedents=='Oui')
cf10<-subset(cf9, cf9$Decision!='Seul')
summary(cf10)

#subset WE VS semaine
smn<-subset(theseAlice, theseAlice$`Week-end`=='Non')
we<-subset(theseAlice, theseAlice$`Week-end`=='Oui')

#subset différentes tranches horaires
table(theseAlice$`Tranche horaire`)
nuit<-subset(theseAlice, theseAlice$`Tranche horaire`=='Nuit')
hrOvr<-subset(theseAlice, theseAlice$`Tranche horaire`=='Heures ouvrees')
nuitPrf<-subset(theseAlice, theseAlice$`Tranche horaire`=='Nuit profonde')

#compa devenir we VS semaine
dvnWe<-table(theseAlice$Devenir, theseAlice$`Week-end`)
dvnWe
fishDvnWe<-fisher.test(dvnWe)
fishDvnWe

#compa devenir si Cs évitable ou non
dvnEvit<-table(theseAlice$Devenir, theseAlice$Evitabilite)
dvnEvit
fishDvnEvit<-fisher.test(dvnEvit)
fishDvnEvit

#compa confiance we VS sem
cfcWe<-table(theseAlice$Confiance, theseAlice$`Week-end`)
cfcWe
fishCfcWe<-fisher.test(cfcWe)
fishCfcWe

#compa directives we VS sem
drcWe<-table(theseAlice$Directives, theseAlice$`Week-end`)
drcWe
fishDrcWe<-fisher.test(drcWe)
fishDrcWe

#compa lata we VS sem
lmtWe<-table(theseAlice$Limitation, theseAlice$`Week-end`)
lmtWe
fishLmtWe<-fisher.test(lmtWe)
fishLmtWe

#compa confiance tranche horaires
cfcTrcHr<-table(theseAlice$Confiance, theseAlice$`Tranche horaire`)
cfcTrcHr
fishCfcTrcHr<-fisher.test(cfcTrcHr)
fishCfcTrcHr

#compa directives tranche horaires
drcTrcHr<-table(theseAlice$Directives, theseAlice$`Tranche horaire`)
drcTrcHr
fishDrcTrcHr<-fisher.test(drcTrcHr)
fishDrcTrcHr

#compa lata tranche horaires
lmtTrcHr<-table(theseAlice$Limitation, theseAlice$`Tranche horaire`)
lmtTrcHr
fishLmtTrcHr<-fisher.test(lmtTrcHr)
fishLmtTrcHr


#compa origine si we VS sem
orgnWe<-table(theseAlice$Origine,theseAlice$`Week-end`)
orgnWe
fishorgnWe<-fisher.test(orgnWe)
fishorgnWe

#compa origine selon tranches horaires
orgTrc<-table(theseAlice$Origine,theseAlice$`Tranche horaire`)
fisOrgTrc<-fisher.test(orgTrc)
fisOrgTrc

#plus d'actualité
ntHr<-subset(theseAlice, theseAlice$`Tranche horaire`=='Nuit' | theseAlice$`Tranche horaire`=='Heures ouvrees')
ntHr
ntHrTrchOrg<-table(ntHr$Origine,ntHr$`Tranche horaire`)
ntHrTrchOrg
fishntHr<-fisher.test(ntHrTrchOrg)
fishntHr

ntNtPr<-subset(theseAlice, theseAlice$`Tranche horaire`=='Nuit' | theseAlice$`Tranche horaire`=='Nuit profonde')
ntNtPr
ntNtPrTrchOrg<-table(ntNtPr$Origine,ntNtPr$`Tranche horaire`)
ntNtPrTrchOrg
fishntNtPr<-fisher.test(ntNtPrTrchOrg)
fishntNtPr

ntPrfHr<-subset(theseAlice, theseAlice$`Tranche horaire`=='Nuit profonde' | theseAlice$`Tranche horaire`=='Heures ouvrees')
ntPrfHr
ntPrfHrTrchOrg<-table(ntPrfHr$Origine,ntPrfHr$`Tranche horaire`)
ntPrfHrTrchOrg
fishntPrfHr<-fisher.test(ntPrfHrTrchOrg)
fishntPrfHr

orgnTrch<-table(theseAlice$Origine,theseAlice$`Tranche horaire`)
orgnTrch
fishOrgnTrch<-fisher.test(orgnTrch, conf.level = 0.9833)
fishOrgnTrch
summary(fishOrgnTrch)

