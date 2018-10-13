library(ggplot2)


ndvi<-read.csv(file.choose())
ndvi
names(ndvi)[2]<-"NDVI"
names(ndvi)
myplot<-ggplot(data = ndvi,aes(x=year,y=month))+scale_y_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))+scale_x_continuous(breaks=c(2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015))+geom_tile(aes(fill=NDVI))+scale_fill_gradient(low="green",high="red")
newplot1<-myplot+theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
newplot1<-newplot1+theme(axis.text.x = element_text(face = "bold",color="black",size = 18, angle = 10),axis.text.y = element_text(face = "bold",color="black",size = 18))+xlab("Year")+ylab("Month")+theme(text=element_text(size = 18,color = "black",face = "bold"))
newplot1



