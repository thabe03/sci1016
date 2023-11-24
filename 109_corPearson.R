rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

require("datasets")
data("iris")
Y <- iris[, "Sepal.Width"]
X <- iris[, "Sepal.Length"]

#CorrelationdePearson
xycorr <- cor(Y, X, method = "pearson")
print(cat("corrélation ",xycorr))
# Cette valeur étant négative et faible, la relation entre Sepal.Width et 
# Sepal.Length est donc inversement proportionnelle et faible.

#RegressiondeXsurY Relation de régression
model1 <- lm(Y ~ X)
plot(Y ~ X, col = X)
title(main = "Variation de Sepal.Width en fonction de Sepal.Length")
abline(model1, col = "blue", lwd = 3)
# La pente de cette droite étant négative ce qui confirme l’existence d’une corrélation
# négative entre entre Sepal.Width et Sepal.Length . Ainsi,
# si nous augmentons Sepal.Width, la valeur de Sepal.Length diminuera
# et vice-versa.