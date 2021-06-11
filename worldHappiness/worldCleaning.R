world.happiness.report.2021 <- read.csv("~/Downloads/archive/world-happiness-report-2021.csv")
View(world.happiness.report.2021)
world.happiness.report <- read.csv("~/Downloads/archive/world-happiness-report.csv")
View(world.happiness.report)
View(world.happiness.report)
pastHappy <- world.happiness.report[,-c(10,11)]
View(world.happiness.report.2021)
currentHappy <- world.happiness.report.2021[,-c(4:6, 13:20)]
View(pastHappy)
View(currentHappy)
View(pastHappy)
View(currentHappy)
currentHappy <- currentHappy$Year<- 2021
currentHappy <- world.happiness.report.2021[,-c(4:6, 13:20)]
currentHappy$Year<-2021
currentHappy
View(currentHappy)
regions <- currentHappy$Regional.indicator
names(regions) <- currentHappy$Country.name
pastHappy <- named(pastHappy$Country.name)
pastHappy <- regions(pastHappy$Country.name)
pastHappy <- regions[pastHappy$Country.name]
pastHappy
pastHappy <- named(pastHappy$Country.name)
pastHappy <- world.happiness.report[,-c(10,11)]
pastRegions <- regions(past$happy)
pastHappy <- regions[pastHappy]
pastRegions <- regions[pastHappy$Country.name]
testRegions <- pastHappy$pastRegions
regions[pastHappy$Country.name]
pastHappy <- merge(pastHappy, pastRegions,by='Country.name')
head(pastRegions)
pastRegions[1,]
pastRegions[1]
pastRegions[1:10]
testHappy <- merge(pastHappy, pastRegions)
head(testHappy)
View(testHappy)
testHappy <- regions[pastHappy]
testHappy <- regions[pastHappy$Country.name]
testHappy <- pastHappy$Regions <- regions[Country.name]
testHappy <- pastHappy$Regions <- regions[pastHappy$Country.name]
names(pastRegions) <- Regional.indicator$Country.name
regions
names(regions) <- Regional.indicator$Country.name
regions <- currentHappy$Regional.indicator
names(regions) < currentHappy$Country.name
names(regions) <- currentHappy$Country.name
regions
regions[pastHappy]
regions[pastHappy$Country.name]
pastHappy$Regions <- regions[pastHappy$Country.name]
View(pastHappy)
pastHappy$Region <- regions[pastHappy$Country.name]
pastHappy$Region <- regions[pastHappy$Country.name]
pastHappy <- pastHappy[,-10]
pastHappy <- as_tibble(past_happy) %>% rename(Country = Country.name, Year = Year, Happiness = Life.Ladder, "GDP Per Capita" = Log.GDP.per.capita, "Social Support" = Social.support, Health = Healthy.life.expectancy.at.birth, Freedom = Freedom.to.make.life.choices, Corruption = Perceptions.of.corruption)
library(dplyr)
pastHappy <- as_tibble(past_happy) %>% rename(Country = Country.name, Year = Year, Happiness = Life.Ladder, "GDP Per Capita" = Log.GDP.per.capita, "Social Support" = Social.support, Health = Healthy.life.expectancy.at.birth, Freedom = Freedom.to.make.life.choices, Corruption = Perceptions.of.corruption)
pastHappy <- as_tibble(pastHappy) %>% rename(Country = Country.name, Year = Year, Happiness = Life.Ladder, "GDP Per Capita" = Log.GDP.per.capita, "Social Support" = Social.support, Health = Healthy.life.expectancy.at.birth, Freedom = Freedom.to.make.life.choices, Corruption = Perceptions.of.corruption)
pastHappy <- as_tibble(pastHappy) %>% rename(Country = Country.name, Year = year, Happiness = Life.Ladder, "GDP Per Capita" = Log.GDP.per.capita, "Social Support" = Social.support, Health = Healthy.life.expectancy.at.birth, Freedom = Freedom.to.make.life.choices, Corruption = Perceptions.of.corruption)
pastHappy <- pastHappy %>% relocate(Region, .after=Country)
View(currentHappy)
currentHappy <- as_tibble(currentHappy) %>% rename(Country=Country.name, Region=Regional.indicator, Happiness=Ladder.score, "GDP Per Capita" = Logged.GDP.per.capita, "Social Support" = Social.support, Health = Healthy.life.expectancy, Freedom= Freedom.to.make.life.choices, Corruption = Perceptions.of.corruption)
currentHappy <- currentHappy %>% relocate(Year, .after=Region)
happiness_index <- rbind(currentHappy, pastHappy)
na.omit(happiness_index)
View(happiness_index)
happiness_index <- na.omit(happiness_index)
happiness_index <- as_tibble(happiness_index)
happiness_index <- happiness_index %>% arrange(Country, Year)