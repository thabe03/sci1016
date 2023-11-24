rm(list = ls())
require(stats)
reg <- lm(cars$dist ~ cars$speed)
coeff = coefficients(reg)
#Equationdeladroitederegression:
eq = paste0("y=", round(coeff[2], 1), "x+", round(coeff[1], 1))
#Graphes
plot(cars, main = eq, col = "red")
abline(reg, col = "green")