library (lubridate)
library(ggplot2)
library(scales)
library (gridExtra)
library (grid)
library(dplyr)

harMetDaily.09.11<-read.csv(file="/Users/Pushkar/Downloads/NEON-DS-Met-Time-Series/HARV/FisherTower-Met/Met_HARV_Daily_2009_2011.csv", stringsAsFactors = FALSE)

harMetDaily.09.11$date<-as.Date(harMetDaily.09.11$date)

AirTempDaily <-ggplot(harMetDaily.09.11,aes(date,airt))+geom_point()+ggtitle("Daily Air Teperature\nNeon Harvard Forest\n2009-2011")+
  xlab("Date")+ylab("Temperature(c)")+scale_x_date(labels = date_format("%m-%y"))+theme(plot.title = element_text(hjust=0.5,lineheight = .9,face="bold",size = 20))+
  theme(text = element_text(size=18))
AirTempDaily
AirTempDaily+facet_grid(.~year)

harMetDaily.09.11$year<-year(harMetDaily.09.11$date)
head(harMetDaily.09.11$year)
tail(harMetDaily.09.11$year)


AirTempDaily_jd <-ggplot(harMetDaily.09.11,aes(jd,airt))+geom_point()+ggtitle("Air Teperature\nNeon Harvard Forest\n2009-2011")+
xlab("Julian Day")+ylab("Temperature(C)")+theme(plot.title = element_text(lineheight = 0.8,hjust=0.5,face="bold",size=20))+theme(text=element_text(size = 18))
AirTempDaily_jd+facet_grid(.~year)
AirTempDaily_jd+facet_grid(year~.)
AirTempDaily_jd+facet_wrap(~year,ncol=2)
