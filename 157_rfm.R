rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Chargeonsd'abordlalibrairiedplyr
library(dplyr)
library(tidyr)
df <- read.csv(file = "data.csv", sep = ",")

#Vérifierl'existencedesvaleursnégatives
print(paste("quantité nulle", any(df$Quantity < 0)))
print(paste("prix nulle", any(df$UnitPrice < 0)))
#RemplacerlesvaleursnégativespardesNA
df <- df %>% mutate(
  Quantity = replace(df$Quantity, df$Quantity <= 0, NA),
  UnitPrice = replace(df$UnitPrice, df$UnitPrice <= 0, NA)
)

#SupprimerleslignesavecdesNA
df <- drop_na(df)
df <-
  df %>% mutate(
    InvoiceNo = as.factor(InvoiceNo),
    StockCode = as.factor(StockCode),
    InvoiceDate = as.Date(InvoiceDate, '%m/%d/%Y%H:%M'),
    CustomerID = as.factor(CustomerID),
    Country = as.factor(Country)
  )
#Créerlacolonne"Total"
df <- df %>% mutate(Total = Quantity * UnitPrice)
df_RFM <- df %>%
  group_by(CustomerID) %>%
  summarise(
    Recence = as.numeric(as.Date("2012-01-01") - max(InvoiceDate)),
    Frequence = n_distinct(InvoiceNo),
    Montant = sum(Total) / n_distinct(InvoiceNo)
  )

hist(
  df_RFM$Recence,
  main = "Histogramme de récence",
  xlab = "Récence",
  ylab = "Client",
  border = "blue",
  col = "green",
  las = 1
)

hist(
  df_RFM$Frequence,
  main = "Histogramme de récence",
  xlab = "Récence",
  ylab = "Client",
  border = "blue",
  col = "green",
  las = 1
)

hist(
  df_RFM$Montant,
  main = "Histogramme de récence",
  xlab = "Montant",
  ylab = "Client",
  border = "blue",
  col = "green",
  las = 1
)