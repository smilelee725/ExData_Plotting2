library(ggplot2)
library(dplyr)

nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
nei$year<-as.character(nei$year)

scc<-readRDS("Source_Classification_Code.rds")

#### Get coal related sources SCC
scc_coal<-filter(scc, grepl('Coal', EI.Sector))[,1]
#### Get coal related dataset
bt4<-filter(nei,SCC %in% scc_coal) %>% group_by(year) %>% summarize(Emissions = sum(Emissions,na.rm = TRUE))
#### Plot
png("plot4.png",width=800,height=480)
g4<-qplot(year,Emissions,data=bt4, geom = "bar",stat = "identity",main = "PM2.5 from coal combustion-related sources") +
    xlab("Year") + ylab("Emissions")
g4
dev.off()

detach(nei)