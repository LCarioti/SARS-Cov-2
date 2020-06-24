library(lubridate)
library(utils)
library(readxl)

Today <- today()

Url = paste0("https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-", Today,".xlsx")
download.file(url =Url , destfile = "tmp.xlsx", mode="wb")

data <- read_excel("tmp.xlsx")

write.csv(data,  quote=FALSE, row.names=FALSE,  'ecdcTimeseries.csv')

