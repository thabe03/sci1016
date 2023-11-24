rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

MyData<-read.csv("icecream.csv",header=T,sep=",")
plot(MyData)