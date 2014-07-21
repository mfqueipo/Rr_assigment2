NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#5.How have emissions from motor vehicle sources
#changed from 1999-2008 in Baltimore City? 

data3<- subset(NEI,fips=="24510" & type=="ON-ROAD")
xnames<-names(tapply(NEI$Emissions,NEI$year,sum))
png(file="plot5.png", width=480, height=480)
plot(tapply(data3$Emissions,data3$year,sum),xaxt="n",xlab="years",ylab="Emissions from motor vehicle sources in Baltimore")
axis(1, at=1:length(xnames), labels=xnames)
dev.off()