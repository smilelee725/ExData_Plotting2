nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
year<-as.character(year)

############### Question 1 ################
###########################################
png("plot1.png",width=480,height=480)
barplot(tapply(Emissions,as.factor(year),sum),col = 'Blue',xlab= "Year", ylab = "Emissions", main = "PM2.5 Emissions 1999 - 2008")
dev.off()

detach(nei)
