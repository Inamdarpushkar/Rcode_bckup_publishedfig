library (lubridate)
library(ggplot2)
library(scales)
library (gridExtra)
library (grid)
library(dplyr)

gracedata<-read.csv(file.choose())
names(gracedata)
names(gracedata)[6]<-"month"
names(gracedata)[9]<-"value"
 
names(gracedata)[10]<-"max"
names(gracedata)[11]<-"min"
names(gracedata) 

aggdta<-aggregate(gracedata$value, by=list(gracedata$Month,gracedata$Year),FUN=mean)
aggdta


errmin<-aggregate(gracedata$min,by=list(gracedata$Month,gracedata$Year),FUN=mean)
errmin
errmax<-aggregate(gracedata$max,by=list(gracedata$Month,gracedata$Year),FUN=mean)
errmax

limits<-aes(ymax=errmax$x, ymin=errmin$x)
grace <-ggplot(aggdta,aes(Group.1,x))+geom_smooth(method = lm,se=FALSE)+geom_point()+geom_errorbar(limits,width=0.2,colour="red")+geom_hline(yintercept = 0,linetype="dashed")+
  xlab("Months")+ylab("Equivalent Water Height")+theme(plot.title = element_text(lineheight = 0.8,hjust=0.5,face="bold",size=20))+theme(text=element_text(size = 18,colour = "black",face="bold"))+theme(axis.text=element_text(size = 18,colour = "black",face="bold"))
grace
newgrace<-grace+facet_wrap(~Group.2,ncol=3)+scale_x_continuous(breaks=c(3,6,9,12))+
          theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background=element_blank(),
          axis.line = element_line(colour = "black"))
newgrace
ggsave(filename = "GRACEmonth.jpeg",path="/Volumes/Sony_16GR/Grace_R",newgrace,dpi=800, width = 14.2,height = 9.48 )

