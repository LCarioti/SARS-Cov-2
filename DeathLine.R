library("ggplot2")
require(reshape2)
library(scales)

options("scipen"=999)
Dcolor = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
DcolorR <- sample(Dcolor, 433, replace = F)

Conf <- read.csv('cumSumD.csv',check.names=FALSE)
long <-  melt(Conf, id.vars='index')
long$index <- as.Date(long$index)
ggplot(long, aes(x=index, y=value,fill=variable))  + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") +  scale_fill_manual(values = DcolorR) + xlab('Date') + ylab('Total Deaths') + facet_wrap( ~ variable, scales='free_y', nrow=6, ncol=5) + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none",  panel.background = element_rect(fill = "black")   ) + scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))
ggsave('TotalDeathEU.png',dpi=600, width= 37, height=22, units='cm')


day <- read.csv('dailyD.csv',check.names=FALSE)
data2 <- day[-c(1:2),]
long2 <-  melt(data2, id.vars='index')
long2$index <- as.Date(long2$index)
ggplot(long2, aes(x=index, y=value, fill=variable))  + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") +  scale_fill_manual(values = DcolorR)  + xlab('Date') + ylab('Daily Deaths') + facet_wrap( ~ variable, scales='free_y', nrow=6, ncol=5) + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none" ,  panel.background = element_rect(fill = "black")  ) +  scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))
ggsave('DailyDeathEU.png',dpi=600, width= 37, height=22, units='cm')

ggplot(long2, aes(x=index, y=value,fill=variable)) + geom_bar(position = position_stack(reverse = TRUE) , stat="identity", colour='black') + scale_fill_manual(values = DcolorR) + xlab('Date') + ylab('Daily Deaths') + theme_bw() + theme(axis.text.x=element_text(color="red", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="red", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='red', size=15), axis.title.y = element_text(colour='red', size=15)  , plot.background = element_rect(fill = "white") , strip.background = element_rect(fill="white") , strip.text = element_text(colour='red', size=20), legend.title=element_blank(), legend.text = element_text(colour="red", size=10)  ) + scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))
ggsave('DailyDeathBarEu.png',dpi=600, width= 37, height=22, units='cm')


pct <- read.csv('PctD.csv',check.names=FALSE)
data3 <- pct[-c(1:14),]
long3 <- melt(data3, id.vars='index')
long3$index <- as.Date(long3$index)
ggplot(long3, aes(x=index, y=value, fill=variable))  + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") +  scale_fill_manual(values = DcolorR)  + xlab('Date') + ylab('14 Days Deaths Increase %') + facet_wrap( ~ variable, scales='free_y', nrow=6, ncol=5) + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none" ,  panel.background = element_rect(fill = "black")  ) +  scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months")) + scale_y_continuous(trans="log1p", breaks = c(1,10,100),limits=c(0,100)   ) 
ggsave('14DaysDeathPercentageEU.png',dpi=600, width= 37, height=22, units='cm')


