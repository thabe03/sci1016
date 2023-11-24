rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

data(HairEyeColor)
a<-as.table(apply(HairEyeColor,c(1,2),sum))
barplot(a,main="Eye en fonction de Hair", legend=rownames(a),font.axis=2)
barplot(a,main="Eye en fonction de Hair", legend=rownames(a),font.axis=2,horiz=TRUE)