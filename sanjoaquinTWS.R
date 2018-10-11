library(ggplot2)


tws3<-read.csv(file.choose())
tws3
names(tws3)[2]<-"TWS"
names(tws3)[3]<-"year"
names(tws3)
myplot1<-ggplot(data = tws2,aes(x=year,y=month))+scale_y_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))+scale_x_continuous(breaks=c(2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015))+geom_tile(aes(fill=TWS))+scale_fill_gradient(low="sky blue",high="blue")
newplot4<-myplot+theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
newplot4<-newplot4+theme(axis.text.x = element_text(face = "bold",color="black",size = 18, angle = 10),axis.text.y = element_text(face = "bold",color="black",size = 18))+xlab("Year")+ylab("Month")+theme(text=element_text(size = 18,color = "black",face = "bold"))
newplot4

ggsave(filename = "sanjoaquinTWS.jpeg",path="/Volumes/Sony_16GR/Grace_R",newplot4,dpi=800, width = 16.2,height = 8.48 )
