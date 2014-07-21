NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#2.Have total emissions from PM2.5 decreased in the
#Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.
xnames<-names(tapply(NEI$Emissions,NEI$year,sum))
data2<- subset(NEI,fips=="24510")

png(file="plot2.png", width=480, height=480)
plot(tapply(data2$Emissions,data2$year,sum),xaxt="n",xlab="years",ylab="Emissions Baltimore City, Maryland ")
axis(1, at=1:length(xnames), labels=xnames)
dev.off()