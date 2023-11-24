rm(list = ls())

library(datasets)
library(ggplot2)

ggplot(iris, aes(Petal.Length, Petal.Width, color = Species))+geom_point()
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)

#Matrisedeconfusion
table(irisCluster$cluster, iris$Species)

#Representationdesclusters
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris,aes(Petal.Length, Petal.Width, color = irisCluster$cluster))+geom_point()

#Representationdelasilhouette
library(cluster)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
s <- silhouette(irisCluster$cluster, dist(iris[, 3:4]))
plot(s)
