
library(utils)

dataEU <- read.csv("https://opendata.ecdc.europa.eu/covid19/nationalcasedeath_eueea_daily_ei/csv", na.strings = "", fileEncoding = "UTF-8-BOM")


write.table(dataEU,, file ='dataEU.csv', sep ='\t',  row.names = FALSE, quote = FALSE)
