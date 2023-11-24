rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

MyTable<-runif(100,min=0,max=999)
#Tridansunordrecroissant
MyOrderedTable_ascending<-sort(MyTable,decreasing=FALSE)
#Tridansunordredécroissant
MyOrderedTable_descending<-sort(MyTable,decreasing=TRUE)