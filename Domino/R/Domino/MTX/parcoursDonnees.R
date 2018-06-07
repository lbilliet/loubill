install.packages("devtools")
# devtools::install_github("lbilliet/loubill")
setwd("C:/Users/lb3/OneDrive/not_sync/Rworkspace/MTX")
dfMtx<-read.csv2("METHOTREXATEcontentPost.csv")
names(dfMtx)
str(dfMtx)
class(dfMtx)
rownames(dfMtx)
# summary(dfMtx)

result <- NULL
dfMtx$contanetate <- ''

for (i in 1 : nrow(dfMtx)){

  for (j in 1 : ncol(dfMtx)){
    if (j == 1){
      result <- dfMtx[i, j]
    } else {
      result <- paste0(result, dfMtx[i, j])
    }
  }
  
  dfMtx$contanetate[i] <- result
  
}

dfMtx[35,5]
