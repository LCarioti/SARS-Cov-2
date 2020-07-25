library("ggplot2")
require(reshape2)
library(ggthemes)
library(scales)

options("scipen"=999)

data <- read.csv('Daily.csv',    check.names=FALSE)

data2 <-  data[-c(1:32),]

long <- melt(data2, id.var="date")

long$date <- as.Date(long$date)


p <- ggplot(long, aes(x=date,y=value,fill=variable)) + geom_bar(position = position_stack(reverse = TRUE) , stat="identity") 



p +  xlab("Date") + ylab("Daily Infection / Daily Death") + theme_stata(scheme = "s1color") + scale_fill_stata("s1color") + theme( axis.title.x= element_text(color="black", face="bold", size= 14), axis.title.y= element_text(color="black", face="bold", size= 14),   axis.text.x=element_text(color="black", face="bold", angle=90, vjust=0.5),  axis.text.y=element_text(color="black", face="bold"), legend.title=element_blank(), legend.text= element_text(color="black", face="bold"), axis.line.x = element_line(colour = "black", size = 1.0 ),   axis.line.y = element_line(colour = "black", size = 1.0 ), legend.key=element_rect(fill = "white", colour="white") , legend.position="top",   plot.background = element_rect(fill = "white", colour="white"), panel.background = element_rect(fill = "white", colour="white") , panel.grid.major.x = element_line(color="white",  size=0.2), panel.grid.major.y=element_line(color="black",  size=0.2) ,   panel.grid.minor = element_line(color="white", size=0.1 ), panel.border = element_rect(fill = NA, color = "white")) + scale_x_date(labels = date_format("%b-%y"),  breaks = date_breaks("1 months"))

ggsave('daily.png',,dpi=600, width= 37, height=22, units='cm')

