library (lubridate)
library(ggplot2)
library(scales)
library (gridExtra)
library (grid)
library(dplyr)
#grace1
graceall<-read.csv(file.choose())
names(graceall)
class(graceall$my)


gracagg1<-aggregate(graceall$value, by=list(graceall$my,graceall$Month,graceall$Year),FUN=mean)
gracagg1

gracagg1$Group.1<-factor(gracagg1$Group.1,levels = unique(gracagg1$Group.1))
gracagg1$Group.1

errmin<-aggregate(graceall$min,by=list(graceall$my,graceall$Month,graceall$Year),FUN=mean)
errmin
errmax<-aggregate(graceall$max,by=list(graceall$my,graceall$Month,graceall$Year),FUN=mean)
errmax


splintry<-as.data.frame(spline(gracagg1$Group.1,gracagg1$x))
splintry
limits<-aes(ymax=errmax$x, ymin=errmin$x)
plt<-ggplot(gracagg1,aes(x=Group.1,y=x, group=1))+geom_line(data = splintry, aes(x=x,y=y, group=1),size=1)+
  scale_x_discrete(breaks=c("Apr-03","Apr-04","Apr-05","Apr-06","Apr-07","Apr-08","Apr-09","Apr-10","Apr-11","Apr-12","Apr-13","Apr-14","Apr-15"))+geom_point(size=3)+
  geom_smooth(se=F)+geom_errorbar(limits,width=0.2,colour="red")+geom_hline(yintercept = 0,linetype="dashed")
plt1<-plt+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background=element_blank(),axis.line = element_line(colour = "black"),axis.text.x = element_text(face = "bold",color="black",size = 18, angle = 10),axis.text.y = element_text(face = "bold",color="black",size = 18))
plt2<-plt1+xlab("Date")+ylab("Equivalent Water Height (mm)")+theme(text=element_text(size = 18,color = "black",face = "bold"))
plt2                                                            
ggsave(filename = "GRACE2year.jpeg",path="/Volumes/Sony_16GR/Grace_R",plt2,dpi=800, width = 16.2,height = 8.48 )                                                            
