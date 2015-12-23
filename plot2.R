nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
year<-as.character(year)

############### Question 2 ################
###########################################
png("plot2.png",width=480,height=480)
barplot(tapply(Emissions[which(fips == "24510")],as.factor(year[which(fips == "24510")]),sum),col = 'Blue',xlab= "Year", ylab = "Emissions", main = "Baltimore City PM2.5 Emissions 1999 - 2008")
dev.off()

detach(nei)