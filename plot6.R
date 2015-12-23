library(ggplot2)
library(dplyr)

nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
nei$year<-as.character(nei$year)

############### Question 6 ################
###########################################
scc<-readRDS("Source_Classification_Code.rds")

#### Get motor vehicle related sources SCC
scc_vehicles<-filter(scc, grepl('Vehicles', EI.Sector))[,1]
#### Get motor vehicle related dataset
bt6<-filter(nei,SCC %in% scc_vehicles & (fips=="24510" | fips == "06037")) %>% group_by(year,fips) %>% summarize(Emissions = sum(Emissions,na.rm = TRUE))
#### Map code to name
bt6<-mutate(bt6,fips=replace(fips,fips=="24510","Baltimore City")) %>% mutate(fips=replace(fips,fips=="06037","Los Angeles"))

#### Plot
png("plot6.png",width=800,height=480)
g6<-ggplot(bt6,aes(year,Emissions)) + geom_bar(stat = "identity") + facet_grid(. ~ fips) +
    xlab("Year") + ylab("Emissions") + ggtitle("PM2.5 from motor vehicles sources comparison between Baltimore City and Los Angeles")
g6
dev.off()
###########################################
detach(nei)
