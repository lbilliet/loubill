chemRepTr<-getwd()
chemRepTr
resRchYaf<-grep("lb3", chemRepTr, ignore.case = T)
resRchYaf
resRchTourLin<-grep("/home/louis", chemRepTr, ignore.case = T)
resRchTourLin
if (resRchYaf==1) {
  setwd("C:/Users/lb3/OneDrive/not_sync/git")
} else if (resRchTourLin==1) {
  setwd("~/git")
}
rm(chemRepTr, resRchTourLin, resRchYaf)
package.skeleton(name = "SetWdWinUnix")
library("SetWdWinUnix")

