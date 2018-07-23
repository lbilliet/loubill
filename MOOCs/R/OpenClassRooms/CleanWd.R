wd<-function (){
  rm(list = ls())
  chemRepTr <- getwd()
  resRchYafExt <- grep("local", chemRepTr, ignore.case = T)
  resRchYafInt <- grep("lb3", chemRepTr, ignore.case = T)
  resRchTourLin <- grep("/home/louis", chemRepTr, ignore.case = T)
  if (resRchYafExt == 1) {
    setwd("C:/Users/lb3_local/OneDrive/sync/git/")
  } else if (resRchYafInt == 1) {
    setwd("C:/Users/lb3/OneDrive/sync/git/")
  } else if (resRchTourLin == 1) {
    setwd("~/git/")
  }
  rm(list=ls())
  return(getwd())
}
