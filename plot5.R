library(ggplot2)
library(dplyr)

nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
nei$year<-as.character(nei$year)

############### Question 5 ################
###########################################
scc<-readRDS("Source_Classification_Code.rds")

#### Get motor vehicle related sources SCC
scc_vehicles<-filter(scc, grepl('Vehicles', EI.Sector))[,1]
#### Get motor vehicle related dataset
bt5<-filter(nei,SCC %in% scc_vehicles & fips=="24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions,na.rm = TRUE))
#### Plot
png("plot5.png",width=800,height=480)
g5<-qplot(year,Emissions,data=bt5, geom = "bar",stat = "identity",main = "PM2.5 from motor vehicle sources in Baltimore City") +
    xlab("Year") + ylab("Emissions")
g5
dev.off()

detach(nei)