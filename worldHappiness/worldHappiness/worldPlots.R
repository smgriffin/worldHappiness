# Using boxplot to plot Perceived Corruption by Region

#Changing x-labels to be 45 degree angle

#labels <- unique(happiness_index$Region)
#boxplot(split(happiness_index$Corruption, happiness_index$Region), 
#        main="Perceived Corruption by Region", col= "lightgray", xaxt = "n", xlab = "")

#axis(1, labels = FALSE)
#text(x = seq_along(labels), y= par("usr")[3] - 1, srt= 45, adj=1, labels=labels, xpd=TRUE)


boxplot(split(happiness_index$Corruption, happiness_index$Region), 
        main="Corruption by Region",
        names= c("SAS", "CEE", "MENA", "LAC", "CIS", "NA", "WEU", "SSA","SEA", "EAS"))

# Using ggplot2 to upgrade the boxplot

library(ggplot2)

plot_data <- ggplot(happiness_index, aes(x=Region, y= Corruption, fill=Region))
p <- plot_data + geom_boxplot(alpha=0.3)

# Rotating x-axis labels and adding others
p <- p + theme(axis.text.x = element_text(angle=45, hjust=1), legend.position="none")
p + labs(title= "Perceived Corruption by Region",
         subtitle= "Years 2007-2021",
         caption = "World Happiness Index",
         x= "Region",
         y= "Perceived Corruption") 

# Using group_by to summarize data finding average Happiness in each region

happy_region <- summarise(happiness_region, happiness_mean = mean(Happiness))

# Plot using bar graph to compare

p_bar <- ggplot(happy_region, aes(x= Region, y= happiness_mean, fill=Region)) + geom_bar(stat="identity", alpha=0.3)

# Rotating x-axis labels and adding others
p_bar <- p_bar + theme(axis.text.x = element_text(angle=45, hjust=1), legend.position="none", panel.background= element_blank())
p_bar + labs(title= "Average Happiness by Region",
         subtitle= "Years 2007-2021",
         caption = "World Happiness Index",
         x= "Region",
         y= "Happiness Score")

# Aggregating data by year to see trend in total world happiness over time
# agg_data <- aggregate(happiness_index$Happiness ~ happiness_index$Year, FUN = sum, na.rm=TRUE)


# Removing first 2 rows due to lack of data
# agg_data <- tail(agg_data, -2)

# Rename Columns
# names(agg_data)[names(agg_data) == "happiness_index$Year"] <- "Year"
# names(agg_data)[names(agg_data) == "happiness_index$Happiness"] <- "Happiness"

# Plotting with a facet grid
p_facet <- ggplot(happiness_region, aes(x= Corruption, y= Generosity, color = Region)) + geom_point()
p_facet <- p_facet + facet_grid(cols = vars(Region), scales = "free")
p_facet <- p_facet + theme(strip.text.y = element_text(size = 3))






