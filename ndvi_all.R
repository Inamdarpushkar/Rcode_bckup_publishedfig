library (lubridate)
library(ggplot2)
library(scales)
library (gridExtra)
library (grid)
library(dplyr)
source("http://bioconductor.org/biocLite.R")
biocLite("Heatplus")#NDVI
library(gplots)
library(plotly)
install.packages("gplots")
installed.packages()
ndviall<-read.csv(file.choose())
ndvimatrix<-data.matrix(ndviall)

with(ndviall, {
  out <- matrix(nrow=nlevels(months), ncol=nlevels(year),
                dimnames=list(levels(months), levels(year)))
  out[cbind(months, year)] <- ndvi
  out
})

b<-cbind(ndviall$month,ndviall$year)
b
month1<-factor(ndviall$month,levels = month.name)
month1


?heatmap.2
heatmap.2(ndvimatrix,Rowv =ndvimatrix[,"month"], ,trace="none",margins = c(5,5))

p<-plot_ly(z=ndviall,type = "heatmap")

p
?plot_ly
ndvihmap
