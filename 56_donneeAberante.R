rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

cars1<-cars[1:30,]
cars_outliers<-data.frame(speed=c(19,19,20,20,20),dist=c(190,186,-
210,220,218))
cars2<-rbind(cars1,cars_outliers)

plot(cars1$speed,cars1$dist,xlim=c(0,28),ylim=c(0,230),main="WithoutOutliers",xlab="speed",ylab="dist",pch="*",col="red",cex=2)#Graphiquesanslesoutliers
plot(cars2$speed,cars2$dist,xlim=c(0,28),ylim=c(0,230),main="WithOutliers",xlab="speed",ylab="dist",pch="*",col="red",cex=2)#Graphiqueaveclesoutliers
print(mean(cars2$dist))

Lower=mean(cars2$dist)-(1.5*sd(cars2$dist))#Limiteinferieure
Upper=mean(cars2$dist)+(1.5*sd(cars2$dist))#Limitesuperieure