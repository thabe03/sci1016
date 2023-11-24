rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

MyData<-read.csv(file="satisfaction_hopital.csv",header=TRUE,sep=",")
MyData$service.c<-factor(MyData$service)#levels
tab.service<-table(MyData$service.c)#tablefromfactor
print(tab.service)
barplot(tab.service,main="Repartition des services",xlab="Numero des services",ylab="Effectifs",ylim=c(0,100))

boxplot(MyData$age~MyData$sexe,names=c("Homme","Femme"),main="Repartition des ages par sexe")

lbls<-c("Agriculteur exploitant","Artisan","Commercant","Chef d'entreprise","Cadre","Profession intermediaire","Employe","Ouvrier","Etudiant")
lbls<-paste(lbls,"\n",table(MyData$profession),labels=paste(round(prop.table(table(MyData$profession))*100),"%",sep=""))
pie(table(MyData$profession),main="Repartition des professions",labels=lbls)