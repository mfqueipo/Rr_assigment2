NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(plyr)


#6.Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County,
#California (fips == "06037"). Which city has seen greater changes
#over time in motor vehicle emissions? 

data3<- subset(NEI,fips=="24510" | fips=="06037" )
data4<- subset(data3,type=="ON-ROAD")

xnames<-names(tapply(NEI$Emissions,NEI$year,sum))
data4$city<-'Baltimore'
data4$city[data4$fips=="06037"]<-'Los Angeles'
data5<-as.data.frame(ddply(data4, .(city,year), summarise, total_emissions=sum(Emissions)))

png(file="plot6.png", width=480, height=480)
 qplot(data5$year,data5$total_emissions,data=data5,facets=.~city)+geom_line()+geom_point() 
dev.off()

