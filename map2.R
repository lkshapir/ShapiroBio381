library(rworldmap)
library(sp)
library(rworldxtra)
library(wesanderson)


micra <- read.csv("North_American_Micrathena.csv")

library(ggmap)
Car <- c(left = -110, bottom=6, right=-60, top=35) #set frame w/ lat and long 
get_stamenmap(Car, zoom=4, maptype="watercolor") %>% ggmap() #pipe map type into ggmap framework #obviously ugly coloration, but I liked it for this exercise

qmplot(Longitude, Latitude, data=micra, zoom=5, source = "stamen", maptype = "toner-lite", legend = "left", extent = "devicee", padding=0.2, color=Species, main="Collection Localities of North American and Caribbean Micrathena") + theme(plot.title = element_text(hjust=0.5))

#Bar Plot of species records/ country
species_per_co <- table(micra$Species,micra$Location)
species_per_co <- data.frame(species_per_co)
colnames(species_per_co) <- c("Species", "Location", "Freq")


ggplot(data = species_per_co, aes(fill=Species, y=Freq, x=Location)) + scale_fill_manual(values=wes_palette(n=9, "FantasticFox1", type= "continuous")) + geom_bar(position = "stack", stat = "identity") + ggtitle("Species of Micrathena collected per region") + theme_minimal(base_size = 10, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))


                                  