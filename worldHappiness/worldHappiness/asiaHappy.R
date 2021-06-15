# Add a rank column and create new dataframe for Asian and Southeast Asian countries
currentHappy <- currentHappy %>% rename("GDP" = "GDP Per Capita",
                                        "Social"= "Social Support")
currentHappy <- currentHappy %>% arrange(desc(Happiness))
currentHappy$Rank <- 1:nrow(currentHappy)
happy_asia <- currentHappy %>% subset(Region %in% ("East Asia") | Region %in% ("Southeast Asia"))

# Create a list of variables to plot
var_list <- combn(names(happy_asia)[4:10], 2, simplify=FALSE)

# Use loop to automate plotting various comparisons on point plot
plot_list <- list()
for (i in 4:10) {
  plot_loop <- ggplot(happy_asia, aes_string(x=var_list[[i]][1], y=var_list[[i]][2])) +
    geom_point(size = 3, aes(color= Country))
  plot_list[[i]] <- plot_loop
  file_name <- paste("asia_plot_", i, ".tiff", sep='')
  tiff(file_name)
  print(plot_list[[i]])
  dev.off()
}

# Gather some additional statistics to compare
top_happy <- currentHappy %>% slice_max(Happiness)
bottom_happy <- currentHappy %>% slice_min(Happiness)
mean_happy <- mean(currentHappy$Happiness)

# Form new dataframe comparing the top Asian countries with the worlds best and worst
plot_data_happy <- rbind(happy_asia[1:5,], top_happy, bottom_happy) %>% arrange(Rank)

plot_asia_happy <- plot_data_happy %>% ggplot(aes(x= reorder(Country, -Happiness), y= Happiness, fill=Country)) +
  geom_bar(stat='identity') +
  scale_fill_manual("Legend", values= c("Finland" = "#636363",
                                        "Taiwan Province of China" = "#DADADA",
                                        "Singapore" = "#DADADA",
                                        "Thailand" = "#DADADA",
                                        "Japan" = "#D35151",
                                        "Philippines" = "#DADADA",
                                        "Afghanistan" = "#582626")) +
  geom_text(aes(label = Rank), position = position_stack(vjust = 0.5), alpha= 0.5) +
  geom_hline(yintercept = mean_happy, linetype ="dotted") +
  annotate("text", x= "Afghanistan", y= mean_happy, label= "World Average", vjust =-0.5, size= 2)+ 
  labs(title= "Japanese Happiness in Asia and Abroad",
       subtitle= "World Happiness Index 2021",
       x= "Country",
       y= "Happiness Ladder Score")