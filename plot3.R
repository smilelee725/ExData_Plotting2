library(ggplot2)
library(dplyr)

nei<-readRDS("summarySCC_PM25.rds")
attach(nei)
nei$year<-as.character(nei$year)

############### Question 3 ################
###########################################
####  Make dataset
b_t <- filter(nei,fips=="24510") %>% group_by(type,year) %>% summarize(Emissions = sum(Emissions,na.rm = TRUE))

#### Using qplot
png("plot3.png",width=800,height=480)
g3<-qplot(year,Emissions,data=b_t, facets = .~ type, geom = "bar",stat = "identity",main = "Four types of sources for PM2.5 in Baltimore City") +
    xlab("Year") + ylab("Emissions")
g3
dev.off()

detach(nei) 