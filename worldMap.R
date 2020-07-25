library(ggplot2)
library(dplyr)
require(maps)
require(viridis)
theme_set(
  theme_void()
  )

world_map <- map_data("world")

ecdc <- read.csv('EcdcPct15.csv',  check.names=FALSE)

library(plyr)

revalue(ecdc$Places, c('Antigua and Barbuda' = 'Antigua')) -> ecdc$Places
revalue(ecdc$Places, c("United States of America" = "USA")) -> ecdc$Places
revalue(ecdc$Places, c("Brunei Darussalam" = "Brunei")) -> ecdc$Places
revalue(ecdc$Places, c("Cote dIvoire" = "Ivory Coast")) -> ecdc$Places
revalue(ecdc$Places, c("North Macedonia" = "Macedonia")) -> ecdc$Places
revalue(ecdc$Places, c("Congo" = "Republic of Congo")) -> ecdc$Places
revalue(ecdc$Places, c("Saint Vincent and the Grenadines" = "Saint Vincent")) -> ecdc$Places
revalue(ecdc$Places, c("Eswatini" = "Swaziland")) -> ecdc$Places
revalue(ecdc$Places, c("United Republic of Tanzania" = "Tanzania")) -> ecdc$Places
revalue(ecdc$Places, c("Timor Leste" = "Timor-Leste")) -> ecdc$Places
revalue(ecdc$Places, c("Trinidad and Tobago" = "Trinidad")) -> ecdc$Places
revalue(ecdc$Places, c("United Kingdom" = "UK")) -> ecdc$Places
revalue(ecdc$Places, c("Holy See" = "Vatican")) -> ecdc$Places
revalue(ecdc$Places, c("Czechia" = "Czech Republic")) -> ecdc$Places



ecdc.map <- left_join(world_map, ecdc , by = c('region'='Places'))


ggplot(ecdc.map, aes(long, lat,group = group))+ geom_polygon(aes(fill = ConfLast15 ), color = "black")+scale_fill_viridis_c(option = "D", na.value = 'white', direction = -1 ) + labs(fill="Confirmed Cases \n last 14 days (%)")

ggsave('WorldMap.png',dpi=600, width= 37, height=17, units='cm')
