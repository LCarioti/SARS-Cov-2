library("ggplot2")
require(reshape2)
library(ggthemes)
library(scales)
options("scipen"=999)


dataN <- read.csv('Infect.csv')

dataN2 <- dataN[-c(1:32),]


longN <- melt(dataN2, id.vars='date')


longN$date <- as.Date(longN$date)


minDate <- min(as.Date(longN$date))
maxdate <- max(as.Date(longN$date))


ggplot(longN, aes(x=date, y=value, fill=variable)) + geom_bar(stat = "identity") + facet_wrap( ~ variable, scales='free_y', dir='v') + theme_stata(scheme = "s1color") + scale_fill_stata("s1color") + theme(axis.text.x=element_text(color="black", face="bold", angle=90, vjust=0.5  ),  axis.text.y=element_text(color="black",   face="bold",  angle=0,  vjust=0.5  ) , axis.title.x = element_text(colour='black', face="bold" , size=15) , strip.text = element_text(colour='black', face="bold" ,  size=20)   , legend.title=element_blank(), legend.position="none"  ) + ylab('') +  scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))




ggsave('Cumulative.png',dpi=600, width= 37, height=22, units='cm')
