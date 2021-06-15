# Analyze yearly trends

library(ggplot2)
library(dplyr)
library(RColorBrewer)

# Group the data by years and create a summary
happiness_year <- happiness_index %>% group_by(Year)
happy_year <- happiness_year %>% summarise('Happiness' = mean(Happiness),
                                           'GDP' = mean(GDP),
                                           'Freedom' = mean(Freedom),
                                           'Health' = mean(Health),
                                           'Corruption' = mean(Corruption),
                                           'Generosity' = mean(Generosity))
# Remove first row due to lack of data
happy_year <- happy_year[-1,]

# Some basic plots
p_health <- happy_year %>% ggplot(aes(x= Year, y= Health)) + geom_line() + geom_point()
p_health <- p_health + labs(title= "Average Life Expectancy by Year",
                            subtitle= "Years 2006-2021",
                            caption = "World Happiness Index",
                            x= "Year",
                            y= "Life Expectancy")
p_health <- p_health + scale_color_brewer(palette='Dark2')

p_freedom <- happy_year %>% ggplot(aes(x= Year, y= Freedom)) + geom_line() + geom_point()
p_freedom <- p_freedom + labs(title= "Freedom to Make Life Choices",
                            subtitle= "Years 2006-2021",
                            caption = "World Happiness Index",
                            x= "Year",
                            y= "Freedom")
p_freedom <- p_freedom + scale_color_brewer(palette='Pastel1')

p_corruption <- happy_year %>% ggplot(aes(x= Year, y= Corruption)) + geom_line(color='blue') + geom_point()
p_corruption <- p_corruption + labs(title= "Corruption by Year",
                              subtitle= "Years 2006-2021",
                              caption = "World Happiness Index",
                              x= "Year",
                              y= "Perceived Corruption")

p_generosity <- happy_year %>% ggplot(aes(x= Year, y= Generosity)) + geom_line() + geom_point()
p_generosity <- p_generosity + labs(title= "Generosity over the Years",
                                    subtitle= "Years 2006-2021",
                                    caption = "World Happiness Index",
                                    x= "Year",
                                    y= "Generosity")
p_gdp <- happy_year %>% ggplot(aes(x= Year, y= GDP)) + geom_line() + geom_point()
p_gdp <- p_gdp + labs(title= "GDP by Year",
                                    subtitle= "Years 2006-2021",
                                    caption = "World Happiness Index",
                                    x= "Year",
                                    y= "GDP")

# Plot the happiness ladder by year using violin plot
#p_violin <- happiness_year %>% ggplot(aes(x= Year, y = Happiness)) + geom_violin() + geom_point()
#p_violin <- p_violin + labs(title= "Life Ladder Score by Year",
#                      subtitle= "Years 2006-2021",
#                      caption = "World Happiness Index",
#                      x= "Year",
#                      y= "Life Ladder")