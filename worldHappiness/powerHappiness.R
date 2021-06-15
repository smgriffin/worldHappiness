# Create new dataframe of world powers
happy_power <- happiness_index %>% subset(Country %in% c("United States", "China", "Japan", "Germany", "India"))

p_power_composite <- happy_power %>% ggplot(aes(x= Year, y= Composite, color = Country)) + geom_line() + labs(title= "Happiness Composite Score of World Powers by Year",
                                                                                                            subtitle= "Years 2006-2021",
                                                                                                            caption = "World Happiness Index",
                                                                                                            x= "Year",
                                                                                                            y= "Composite")
p_power_gdp <- happy_power %>% ggplot(aes(x= Year, y= GDP, color = Country)) + geom_line() + labs(title= "GDP over the Years of World Powers",
                                                                                                  subtitle= "Years 2006-2021",
                                                                                                  caption = "World Happiness Index",
                                                                                                  x= "Year",
                                                                                                  y= "GDP")
p_power_freedom <- happy_power %>% ggplot(aes(x= Year, y= Freedom, color = Country)) + geom_line() + labs(title= "Freedom to Make Life Choices in World's Most Powerful Countries",
                                                                                                          subtitle= "Years 2006-2021",
                                                                                                          caption = "World Happiness Index",
                                                                                                          x= "Year",
                                                                                                          y= "Freedom")
p_power_corruption <- happy_power %>% ggplot(aes(x= Year, y= Corruption, color = Country)) + geom_line() + labs(title= "Corruption in the World's Most Powerful Nations",
                                                                                                          subtitle= "Years 2006-2021",
                                                                                                          caption = "World Happiness Index",
                                                                                                          x= "Year",
                                                                                                          y= "Corruption")
