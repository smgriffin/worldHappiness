# Create a composite score column and use that to find trends and outliers

# Libraries
library(dplyr)
library(WVPlots)

# Replace NA with 0 to minimize errors calculating composite score
happiness_index [is.na(happiness_index)] = 0

happiness_index$"Composite" <- happiness_index$Happiness + happiness_index$"GDP Per Capita" + happiness_index$"Social Support" + happiness_index$Health + happiness_index$Freedom + happiness_index$Corruption
# Alternatively, use mutate()

# Group by Country and find the average composite score by Country and average GDP per Capita
happiness_index <- happiness_index %>% rename("GDP" = "GDP Per Capita", "Social" = "Social Support")
happy_country <- happiness_index %>% group_by(Country)
happy_summary <- happy_country %>% summarise('Composite' = mean(Composite),
                                             'GDP' = mean(GDP),
                                             'Social' = mean(Social),
                                             'Health' = mean(Health),
                                             'Freedom' = mean(Freedom),
                                             'Generosity' = mean(Generosity),
                                             'Corruption' = mean(Composite)
                                             )

regions <- happy_country$Region
names(regions) <- happy_country$Country
happy_summary$Region <- regions[happy_summary$Country]

# Arrange the data in order of happiness (descending)
happy_top <- happy_summary %>% arrange(-Composite)

# Take the top 20 happiest countries
happy_top <- happy_top %>% slice(1:20)

# Plot the happiest countries on a horizontal bar graph
p_top <- happy_top %>% mutate(Country = fct_rev(Country)) %>% ggplot(aes(x = Country, y= Composite, fill= Regions)) + geom_bar(stat= 'identity') + coord_flip()
p_top <- p_top + labs(title= "Happiest Countries",
                      subtitle= "Years 2007-2021",
                      caption = "World Happiness Index",
                      x= "Country",
                      y= "Happiness Composite Score")

# Plot the happiest countries on a stacked horizontal bar plot
#p_stacked <- happy_top %>% ggplot(aes(fill = Composite, y= Region, x = GDP + Social + Health + Freedom + Generosity)) + geom_bar(stat='identity')

# Arrange in order of happiness (ascending)
happy_bottom <- happy_summary %>% arrange(Average)

# Take the top 20 least happy countries
happy_bottom <- happy_bottom %>% slice(1:20)

# Plot the least happy countries on a horizontal bar graph
p_bottom <- happy_bottom %>% mutate(Country = fct_rev(Country)) %>% ggplot(aes(x = Country, y= Composite, fill= Regions)) + geom_bar(stat= 'identity') + coord_flip()
p_bottom <- p_bottom + labs(title= "Least Happy Countries",
                      subtitle= "Years 2007-2021",
                      caption = "World Happiness Index",
                      x= "Country",
                      y= "Happiness Composite Score")

# Plot a scatterplot relating GDP to the happiness composite score
ScatterHist(happy_summary, "GDP", "Composite", title="GDP and Happiness")