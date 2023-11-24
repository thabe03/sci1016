rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

MyData <- iris
MyData <- MyData[sample(nrow(MyData)), ]
#Creer 10 folds egaux
folds <- cut(seq(1, nrow(MyData)),
             breaks = 10,
             labels = FALSE,
             seed = 10)
for (i in 1:10) {
  testIndexes <- which(folds == i, arr.ind = TRUE)
  testData <- MyData[testIndexes, ]
  trainData <- MyData[-testIndexes, ]
}
summary(testData)
summary(trainData)