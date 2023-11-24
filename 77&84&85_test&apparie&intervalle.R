rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library("sci1018")
library("nortest")

#77
MyData<-read.csv(file="satisfaction_hopital.csv",header=TRUE,sep=",")
ageM<-MyData$age[!is.na(MyData$age)]
tStudentIC(mean(ageM),sd(ageM),length(ageM),95,ageM-mean(ageM))
testBilateralUnGroupe(ageM,50)

#84
x<-read.csv(file="Mesures-Taille-Eleve-Parents.csv",header=TRUE,sep=";")
xF<-x[x$Sexe=="F",]
testUnilateraleUnGroupeApparie(xF,"Taille","TailleMere","less",TRUE,TRUE)

#85
tStudentIC(170,40,100,95)