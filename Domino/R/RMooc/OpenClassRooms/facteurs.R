rm(list=ls())
chemRepTr<-getwd()
chemRepTr
resRchYaf<-grep("lb3", chemRepTr, ignore.case = T)
resRchYaf
resRchTourLin<-grep("/home/louis", chemRepTr, ignore.case = T)
resRchTourLin
if (resRchYaf==1) {
  setwd("C:/Users/lb3/OneDrive/sync/git/")
} else if (resRchTourLin==1) {
  setwd("~/git/")
}
rm(chemRepTr, resRchTourLin, resRchYaf)
getwd()
setwd("loubill/Domino/R/RMooc/OpenClassRooms/")

#######facteurs sous R = servent à stocker infos qualit, donc avec valeur descriptive
#######facteurs, contrairement aux vecteurs, peuvent contenir des éléments de types différents
####### un des attributs du fact = niveaux, qui est le vecteur qui contient lensemble des valeurs qui peuvent être prises pas les éléments (UNIVERS DES DONNEES)
notes<-factor(c(14,19,16.5,13,17,5,10,3,13.5,12,8.75))
