library(ggplot2)
data=read.csv(file.choose())
attach(data)

cleanup=theme(
  panel.grid.major=element_blank(),                                      # To remove grids
  panel.grid.minor=element_blank(),                                      # To remove grids
  panel.background=element_blank(),
  plot.margin=unit(c(1, 0, 0, 0), "inch"),# To remove plot background
  axis.line=element_line(color="black",size=3),                         # x and y axis line                   
  axis.text.x=element_text(size=55,color="black",face="bold"),                          # x axis numb
  axis.text.y=element_text(size=55,color="black",face="bold"),                          # yaxis numb
  axis.title.y = element_text(size = 65,face="bold"),                     # y axis label                     
  axis.title.x = element_text(size = 65))                     # x axis label    
#plot.title = element_text(lineheight=.8,color="black", face="bold"))                  # plot title (not used here)                    

B = aggregate(data$diff_per_a, by=list(data$YEAR),FUN=mean)
Y=B$Group.1
x1=B$x
ww=coord_cartesian(ylim = c(-1.5, 0.5))
#f=geom_point(aes(x = x1, y = Y)





p<-
  
  ggplot(data,aes (x = YEAR, y = diff_per_a)) +
  geom_smooth(method = "lm", size=1.5, level = 0.68, col = 1) +
  geom_smooth(method = "lm", size=1.5, level = 0.95, col = 1) +
  geom_point(size = 0.01) +
  geom_hline(linetype = "dashed", yintercept = 0,size=1.5) +
  xlab(" ") +
  ylab("Elevation Difference"~(ma^{-1}))+
  scale_fill_grey(name = 'Confidence\n level') +
  annotate("text", x = 2007.4, y = 0.3, label = "DC",face="bold",size=35)+              # Text on plot
  annotate("text", x = 2005, y = -1.3, label = "y = -0.0416x + 82.914",face="bold",size=25)+
  ww+
  cleanup

#p

mx<- data.frame(x=Y, y=x1)
z1=p + geom_point(data=mx,aes(x=Y, y=x1),size=10)+ geom_line(data=mx,aes(x=Y,y=x1),linetype = "dotted", size = 6) 
z1
ggsave(filename = "DC_fittedALL1.jpeg",path="/Volumes/Sony_16GR/R2",z1,dpi=800, width = 24, height = 20 )


