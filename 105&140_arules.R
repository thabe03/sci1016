rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#apriori105
library(arules)
library(arulesViz)

data("Groceries")

Groceries <- read.transactions(
  file = "data2.csv",
  format = "single",
  sep = ",",
  cols=c(1,2),
  rm.duplicates = T
)

rules <-
  apriori(Groceries, parameter = list(support = 0.002, confidence = 0.3)) # apparait dans 1,01% des transactions et confiance dans 80% des transactions
do <- head(rules, n = 10, by = "lift")
inspect(do)

itemFrequencyPlot(Groceries, topN = 30, type = "absolute")
plot(do,
     method = "graph",
     engine = "interactive")

grocery_df <- as(Groceries, "data.frame")

#Règlesciblées135
regles_ciblees <- apriori(
  data = Groceries,
  parameter = list(supp
                   = 0.001, conf = 0.8),
  appearance = list(default = "lhs", rhs = "whole milk"),
  control = list(verbose = F)
)

do3 <- head(regles_ciblees, n = 3, by = "lift")
inspect(do3)

plot(rules,
     method = "graph",
     engine = "interactive", shading=NA)

#dissimilarite141
d <- dissimilarity(regles_ciblees, method = "Jaccard")
library(stats)
cl <- kmeans(d, 5)
plot(d, col = cl$cluster)
points(cl$centers,
       col = 1:5,
       pch = 8,
       cex = 2)

#dats<-strsplit(as.character(dats$items),',',fixed=T)
#trans<-as(dats,"transactions")
#
#dats<-read.table("arules.txt",
#header=T,
#sep=",",
#dec=".")
#trans4<-
#as(split(dats[,"Item_ID"],dats[,"Transaction_ID"]),"transactions")
#str(trans4)
#itemInfo(trans4)
#library(dplyr)
#labels_<-dats%>%select(Item_ID,Category_ID)%>%distinct()
#itemInfo(trans4)<-
#data.frame(labels=labels_$Item_ID,level1=labels_$Category_ID)
#rules2<-
#apriori(trans4,parameter=list(support=0.001,confidence=0.8))
#do2<-head(rules2,n=3,by="lift")
#inspect(do2)
#
#itemFrequencyPlot(trans4,topN=30,type="absolute")
#plot(do2,
#method="graph",
#engine="interactive")