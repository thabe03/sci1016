rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

boxplot(iris$Sepal.Length~iris$Species, main="Especes par sepal_length") #names=c("Homme","Femme")

library(e1071)
sl<-skewness(iris$Sepal.Length)
sw<-skewness(iris$Sepal.Width)
pl<-skewness(iris$Petal.Length)
pw<-skewness(iris$Petal.Width)
ksl<-kurtosis(iris$Sepal.Length)
ksw<-kurtosis(iris$Sepal.Width)
kpl<-kurtosis(iris$Petal.Length)
kpw<-kurtosis(iris$Petal.Width)

PLVersi=iris$Petal.Length[iris$Species=="versicolor"]
hist(PLVersi,breaks=seq(min(PLVersi),max(PLVersi),length.out=11)) #10 batons

plot(iris$Petal.Length,iris$Sepal.Length,las=1,main="Longueur petales vs sepales")
reg=lm(Sepal.Length~Petal.Length,data=iris)
abline(reg,lty=1,col="red") # droite de regression
abline(h=mean(iris$Sepal.Length),lty=3,lwd=2,col="darkgreen")
legend(x=1,y=7.9,legend=c("Donnees observees","Droite de regression","Moyenne de la longueur des sepales"),cex=0.8,pch=c(1,NA,NA),lty=c(NA,1,3),lwd=c(1,1,2),col=c("black","red","darkgreen"))

library(fmsb)
colors_border=c(rgb(0.2,0.5,0.5,0.9),rgb(0.8,0.2,0.5,0.9),rgb(0.7,0.5,0.1,0.9))
colors_in=c(rgb(0.2,0.5,0.5,0.4),rgb(0.8,0.2,0.5,0.4),rgb(0.7,0.5,0.1,0.4))
radarchart(iris[c(1,51,101),1:4],pcol=colors_border,pfcol=colors_in,maxmin=FALSE,vlcex=0.8,title="Diagramme radar")

data(algae,package="DMwR2")
hist(algae$a6,main="(b)Distributiondea6",breaks=seq(min(algae$a6),max(algae$a6),length.out=21))
barplot(table(algae$size),main="Distribution de la taille(size)")
boxplot(algae$NO3~algae$size,main="Repartition de NO3 selon la taille(size)",ylim=c(0.001,12))