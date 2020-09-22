## This is a recreation of figure 1B from Lynch & Connery 2003
install.packages("tidyverse")
library(tidyverse)
data <- read.csv("Lynch_Eukar.csv") #rename file 
view(data)

#changing axis names
names(data)[names(data) == "Total.Genome.Size..Mb."]	= "genome.size"
names(data)[names(data) == "Nu"]	= "NeU"
names(data)[names(data) == "Number.of.Genes"]	= "gene.num"

install.packages("scales")
library(scales)

#axes are not faithful to original
ggplot(data= data) + 
  
  #this portion relates to the Gene Number section of the graph
  geom_point(aes(x = log(genome.size), y = log(gene.num)), shape = 1) + # shape = 1 makes points hollow 
  geom_smooth(aes(x = log(genome.size), y=log(gene.num)), method = "loess", se=FALSE, col = "black")+
  
  #this portion relates to the NeU portion of the graph
  geom_point(aes(x=log(genome.size), y=log(NeU)), col="black")+
  geom_smooth(aes(x = log(genome.size), y=log(NeU)), method = "lm", se=FALSE, col = "black",  linetype = "longdash")+
  theme_classic()+ #makes background white
  xlab("Genome Size (Mb)")+ #label for x axis
  ylab(" ")+ #label for y axis, no label, so just put a space
  annotate("text", label = "NeU", x = 6, y = -2, size = 6, colour = "black")  +  #annotate, places "NeU" near points
  annotate("text", label = "Gene Number", x = 6, y = 7, size = 6, colour = "black")   #annotate, places "Gene Number" near points

