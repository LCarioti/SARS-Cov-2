library(ggplot2)
library(dplyr)
require(maps)
require(viridis)
theme_set(
  theme_void()
  )

world_map <- map_data("world")

EuTable <- read.csv('EuNumbers.csv',  check.names=FALSE)

library(plyr)

revalue(EuTable$Countries, c("Czechia" = "Czech Republic")) -> EuTable$Countries

eu.map=left_join(EuTable,world_map,by = c('Countries'='region'))
ggplot(eu.map,aes(long, lat,group = group))+ geom_polygon(aes(fill =InfectRatio),  color = "black")+scale_fill_viridis_c(option = "viridis", na.value = 'white', direction = -1 ) + labs(fill="Infections\n  per\n million") + ylim(30,75)
ggsave('EuInfection.png',dpi=600, width= 37, height=17, units='cm')
ggplot(eu.map,aes(long, lat,group = group))+ geom_polygon(aes(fill =DeathRatio),  color = "black")+scale_fill_viridis_c(option = "inferno", na.value = 'white', direction = -1 ) + labs(fill="Deaths\n  per\n million") + ylim(30,75)
ggsave('EuDeaths.png',dpi=600, width= 37, height=17, units='cm')
ggplot(eu.map,aes(long, lat,group = group))+ geom_polygon(aes(fill = CFR),  color = "black")+scale_fill_viridis_c(option = "turbo", na.value = 'white', direction = -1 ) + labs(fill="CFR") + ylim(30,75)
ggsave('EuCFR.png',dpi=600, width= 37, height=17, units='cm')

