install.packages("tidyverse")
library(tidyverse)
data <- read.csv("Lynch_Eukar.csv")
view(data)

#changing axis names
names(data)[names(data) == "Total.Genome.Size..Mb."]	= "genome.size"
names(data)[names(data) == "Nu"]	= "NeU"
names(data)[names(data) == "Number.of.Genes"]	= "gene.num"

install.packages("scales")
library(scales)


#Gene Number portion
ggplot(data= data) + 
  geom_point(shape=1, aes(x=genome.size, y=log(gene.num)))+
  xlim(0,1000)
  
#NeU portion
ggplot(data) +
  geom_point(aes(x = log(genome.size), y=log(NeU))) +
  theme_classic() +
  geom_smooth(aes(x = log(genome.size), y=log(NeU)), method = "lm", se=FALSE, col = "black")

  
#combined, couldn't figure out how to do the y axis break
ggplot(data= data) + 
  geom_point(aes(x = log(genome.size), y = log(gene.num)), shape = 1) +
  geom_smooth(aes(x = log(genome.size), y=log(gene.num)), method = "loess", se=FALSE, col = "black")+
  geom_point(aes(x=log(genome.size), y=log(NeU)), col="black")+
  geom_smooth(aes(x = log(genome.size), y=log(NeU)), method = "lm", se=FALSE, col = "black",  linetype = "longdash")+
  theme_classic()+
  xlab("Genome Size (Mb)")+
  ylab(" ")+
  annotate("text", label = "NeU", x = 6, y = -2, size = 6, colour = "black")  +  #annotates plot
  annotate("text", label = "Gene Number", x = 6, y = 7, size = 6, colour = "black")   #annotates plot

