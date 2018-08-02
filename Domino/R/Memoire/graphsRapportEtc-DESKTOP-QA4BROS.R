source("CleanWd.R")
wd()
setwd("loubill/Domino/R/Memoire/")
library(ggplot2)

fichierDate<-"dateCreated.csv"
fichierContent<-"contentLength.csv"

df_longueur<-read.csv(file = fichierContent, header = T, sep = "\t")
df_date<-read.csv(file = fichierDate, header = T, sep = "\t")

# ggplot(data = df_longueur, aes(df_longueur$nPosts, df_longueur$nchar)) + geom_bar() + xlab(names(df_longueur$nchar)) + ylab(names(df_longueur$nPosts)) + theme(axis.text.x = element_text(
#     angle = 45,
#     colour = "black",
#     size = 8
#   ))

ggplot(data = df_longueur, aes(x = df_longueur$nPosts, y = log(df_longueur$nchar)), geom_smooth(), geom_point(), xlab("Nombre de caract?res du post"), ylab("Nombre de posts"))
plot(df_longueur$nchar, log(df_longueur$nPosts), type = "h", xlab = "Nombre de caract?re du post", ylab = "Effectifs")
boxplot(df_longueur$nchar)
fivenum(df_longueur$nchar)
plot(df_longueur$nchar, df_longueur$nPosts, type = "p", xlab = "Nombre de caract?re du post", ylab = "Effectifs", xlim = c(0, 2000), ylim = c(0, 5000))
barplot(table(df_longueur))



ggplot(data = df_date, aes(x = df_date$dateCreated, y = df_date$nPosts), geom_smooth(), geom_point(), xlab("Date de cr?ation du post"), ylab("Nombre de posts"))
plot(df_date$dateCreated, df_date$nPosts, type ="h")
stripchart(df_date)

# head(table(df_longueur[,1]))
# head(table(df_longueur[,2]))
# head(prop.table(table(df_longueur[,1])))
# tail(prop.table(table(df_longueur[,1])))
# plot(table(df_longueur[,1]), type="h",xlab=names(df_longueur[1]),ylab="Effectif")
# plot(table(df_longueur[,2]), type="h",xlab=names(df_longueur[2]),ylab="Effectif")
# plot(prop.table(table(df_longueur[,1])),lwd=7,xlab=names(df_longueur[1]),ylab="Fr?quence")
# barplot(table(df_longueur[,i]),xlab=names(df_longueur[i]),ylab="Effectif")
# barplot(prop.table(table(df_longueur[,i])),xlab=names(df_longueur[i]),ylab="Fr?quence")
# pie(table(df_longueur[,i]))