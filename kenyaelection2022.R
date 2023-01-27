setwd('C:/Users/X250/Documents/code projects/R_tutorial')

install.packages("tidyverse")
install.packages("tmap")
install.packages("dplyr")
install.packages("st")
install.packages("sf")

library('tidyverse')
library('tmap')
library('dplyr')
library('st')
library('sf')


#election
data<-read.csv('election2022.csv')
#read shapefile
counties<-st_read('County.shp')

#merge the two
election<-merge(counties,data,by.x='county_id',by.y='Code')

election$Winner<-ifelse(election$Odinga>election$Ruto,'Raila','Ruto')

mutate(election,turnout=(Total/Registered)*100)

mypal<-c('blue','yellow')
tm_shape(election)+tm_polygons("Winner",palette=mypal,title="Candidate")+
  tm_layout(title="2022 General Election", title.position = c("center","top"))

