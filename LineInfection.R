library("ggplot2")
require(reshape2)
library(scales)

options("scipen"=999)
Conf <- read.csv('Top20.csv', check.names=FALSE)
names(Conf)[names(Conf) == 'United_States_of_America'] <- 'United States'
names(Conf)[names(Conf) == 'United_Kingdom'] <- 'United Kingdom'
names(Conf)[names(Conf) == 'Saudi_Arabia'] <- 'Saudi Arabia'
names(Conf)[names(Conf) == 'South_Africa'] <- 'South Africa'
data <- Conf[-c(1:32),]

long <-  melt(data, id.vars='index')
long$index <- as.Date(long$index)

Dcolor = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
DcolorR <- sample(Dcolor, 433, replace = F)



ggplot(long, aes(x=index, y=value,fill=variable))  + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") + scale_fill_manual(values = DcolorR) + xlab('Date') + ylab('Infection') + facet_wrap( ~ variable, scales='free_y', nrow=5, ncol=4) + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none",  panel.background = element_rect(fill = "black")   ) + scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))  
ggsave('Top20.png',dpi=600, width= 37, height=22, units='cm')


day <- read.csv('Top20Daily.csv', check.names=FALSE)
names(day)[names(day) == 'United_States_of_America'] <- 'United States'
names(day)[names(day) == 'United_Kingdom'] <- 'United Kingdom'
names(day)[names(day) == 'Saudi_Arabia'] <- 'Saudi Arabia'
names(day)[names(day) == 'South_Africa'] <- 'South Africa'
data2 <- day[-c(1:32),]

long2 <-  melt(data2, id.vars='index')
long2$index <- as.Date(long2$index)

ggplot(long2, aes(x=index, y=value, fill=variable))  + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") + scale_fill_manual(values = DcolorR) + xlab('Date') + ylab('Daily Infection') + facet_wrap( ~ variable, scales='free_y', nrow=5, ncol=4) + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none" ,  panel.background = element_rect(fill = "black")  ) +  scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months")) 
ggsave('Top20Daily.png',dpi=600, width= 37, height=22, units='cm')




########## BAR



ggplot(long2, aes(x=index, y=value,fill=variable)) + geom_bar(position = position_stack(reverse = TRUE) , stat="identity", colour='black') + scale_fill_manual(values = DcolorR) + xlab('Date') + ylab('Daily Infection') + theme_bw() + theme(axis.text.x=element_text(color="red", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="red", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='red', size=15), axis.title.y = element_text(colour='red', size=15)  , plot.background = element_rect(fill = "white") , strip.background = element_rect(fill="white") , strip.text = element_text(colour='red', size=20), legend.title=element_blank(), legend.text = element_text(colour="red", size=10)  ) + scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months")) 
ggsave('Top20DailyBar.png',dpi=600, width= 37, height=22, units='cm')


############# PERC 

perc <- read.csv('Top20DayPerc.csv', check.names=FALSE)
names(perc)[names(perc) == 'United_States_of_America'] <- 'United States'
names(perc)[names(perc) == 'United_Kingdom'] <- 'United Kingdom'
names(perc)[names(perc) == 'Saudi_Arabia'] <- 'Saudi Arabia'
names(perc)[names(perc) == 'South_Africa'] <- 'South Africa'
data3 <- perc[-c(1:32),]

long3 <-  melt(data3, id.vars='index')
long3$index <- as.Date(long3$index)


ggplot(long3, aes(x=index, y=value, fill=variable)) + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") +  scale_fill_manual(values = DcolorR) +   facet_wrap( ~ variable, scales='free_y', nrow=5, ncol=4) + xlab('Date') + ylab('Daily Increase %') + theme_dark()  + theme(axis.text.x=element_text(color="white", angle=90, size=10, vjust=0.7, hjust=0.7  ), axis.text.y=element_text(color="white", angle=0, size=10, vjust=0.5  ), axis.title.x = element_text(colour='white', size=15), axis.title.y = element_text(colour='white', size=15)  , plot.background = element_rect(fill = "black") , strip.background = element_rect(fill="black") , strip.text = element_text(colour='white', size=20)  , legend.position="none",  panel.background = element_rect(fill = "black")  ) +  scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months")) + scale_y_continuous(trans="log1p", breaks = c(1,10,100,1000),limits=c(0,1000)   )
ggsave('Top20DailyPercentage.png',dpi=600, width= 37, height=22, units='cm')



