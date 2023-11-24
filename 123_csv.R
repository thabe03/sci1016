rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

df <-
  read.csv(
    file = "Montreal_meteo.csv",
    header = T,
    sep = ",",
    check.names = F,
    encoding = "UTF-8"
  )
df_2010 <- subset(df, df$Year == "2010")
barplot(df_2010$Min.Temp,
        xlab = "Jour",
        ylab = "Températuremin")#Voirfigure7.4(a)
barplot(df_2010$Max.Temp,
        xlab = "Jour",
        ylab = "Températuremax")#Voirfigure7.4(b)
barplot(df$Mean.Temp,
        xlab = "Jour",
        ylab = "Températuremoyenne")#Voirfigure7.5

#CorrélationdePearson
library("ggpubr")

#Corrélationentrevitesseduventettempératuremaximale
corr_spd_max_temp <-
  cor(as.numeric(unlist(df["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df$Max.Temp)),
      method = "pearson",
      use = "complete.obs")

#Corrélationentrevitesseduventettempératureminimale
corr_spd_min_temp <-
  cor(as.numeric(unlist(df["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df$Min.Temp)),
      method = "pearson",
      use = "complete.obs")

#Corrélationentrevitesseduventettempératuremoyenne
corr_spd_mean_temp <-
  cor(as.numeric(unlist(df["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df$Mean.Temp)),
      method = "pearson",
      use = "complete.obs")

df_hiver <- subset(df, df$Month %in% c("1", "2", "12"))
#Corrélationentrevitesseduventettempératuremaximale
corr_spd_max_temp_hiver <-
  cor(as.numeric(unlist(df_hiver["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df_hiver$Max.Temp)),
      method = "pearson",
      use = "complete.obs")

#Corrélationentrevitesseduventettempératureminimale
corr_spd_min_temp_hiver <-
  cor(as.numeric(unlist(df_hiver["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df_hiver$Min.Temp)),
      method = "pearson",
      use = "complete.obs")

#Corrélationentrevitesseduventettempératuremoyenne
corr_spd_mean_temp_hiver <-
  cor(as.numeric(unlist(df_hiver["Spd.of.Max.Gust-kmh"])),
      as.numeric(unlist(df_hiver$Mean.Temp)),
      method = "pearson",
      use = "complete.obs")

#Leminimumdestempératuresminimales
min_mintemp <- min(df_hiver$Min.Temp, na.rm = T)

#Lemaximumdestempératuresminimales
max_mintemp <- max(df_hiver$Min.Temp, na.rm = T)

#Leminimumdestempératuresmaximales
min_maxtemp <- min(df_hiver$Max.Temp, na.rm = T)

#Lemaximumdestempératuresmaximales
max_maxtemp <- max(df_hiver$Max.Temp, na.rm = T)

#Lamoyennedestempératures
mean_meantemp <- mean(df_hiver$Mean.Temp, na.rm = T)

#L'écarttypedestempératuresminimales
sd_mintemp <- sd(df_hiver$Min.Temp, na.rm = T)

#L'écarttypedestempératuresmaximales
sd_maxtemp <- sd(df_hiver$Max.Temp, na.rm = T)