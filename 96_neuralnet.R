rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(neuralnet)
data(iris)
iris$setosa <- iris$Species == "setosa"
iris$virginica <- iris$Species == "virginica"
iris$versicolor <- iris$Species == "versicolor"
iris.train.idx <- sample(x = nrow(iris), size = nrow(iris) * 0.5)
iris.train <- iris[iris.train.idx, ]
iris.test <- iris[-iris.train.idx, ]
#Entrainementdureseaudeneurone
iris.net <- neuralnet(
  setosa + virginica + versicolor ~
    Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
  data = iris.train,
  hidden = c(3, 3),
  rep = 5,
  err.fct = "ce",
  linear.output = F,
  lifesign = "minimal",
  stepmax = 1000000,
  threshold = 0.001
)
plot(iris.net, rep = "best")


iris.prediction <- compute(iris.net, iris.test[-5:-8]) # list
idx <- apply(iris.prediction$net.result, 1, which.max)
predicted <- c('setosa', 'virginica', 'versicolor')[idx]
print(summary(iris.test))  # voir Species
print(table(predicted, iris.test$Species))