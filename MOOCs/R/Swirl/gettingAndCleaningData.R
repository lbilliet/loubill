source("CleanWd.R")
wd()
setwd("loubill/MOOCs/R/Swirl")
rm(list = ls())
library(swirl)

swirl()
mydf<-read.csv(path2csv, stringsAsFactors = FALSE)
dim(mydf)
str(mydf)
summary(mydf)
head(mydf)
tail(mydf)
library(dplyr)
packageVersion("dplyr")
cran<- tbl_df(mydf)
rm("mydf")
cran
?select
select(cran, ip_id, package, country)
5:20
select(cran, r_arch:country)
select(cran, country:r_arch)
cran
select(cran, -time)
-5:20
-(5:20)
select(cran, -(X:size))
filter(cran, package=="swirl")
filter(cran, r_version == "3.1.1", country == "US")
?Comparison
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")
is.na(cran$r_version)
filter(cran, !is.na(r_version))
