NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#4 Across the United States, how have emissions from coal combustion-related
#sources changed from 1999-2008?

SCC$EI.Sector <- as.character(SCC$EI.Sector)
SCC$SCC <-as.character(SCC$SCC)

xnames<-names(tapply(NEI$Emissions,NEI$year,sum))
Codes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)]
i <- !is.na(match(NEI$SCC, Codes))
NEI2 <- NEI[i, ]

png(file="plot4.png", width=480, height=480)
plot(tapply(NEI2$Emissions,NEI2$year,sum),xaxt="n",xlab="years",ylab="Emissions from coal combustion-related")
axis(1, at=1:length(xnames), labels=xnames)
dev.off()