NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(plyr)

#3.Of the four types of sources indicated by the type
#(point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases 
#in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.

data2<- subset(NEI,fips=="24510")

data3<-as.data.frame(ddply(data2, .(type,year), summarise, total_emissions=sum(Emissions)))

png(file="plot3.png", width=480, height=480)
qplot(data3$year,data3$total_emissions,data=data3,facets=.~type)+geom_line()+geom_point() 
dev.off()
