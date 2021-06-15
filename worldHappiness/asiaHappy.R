# Create new dataframe for Asian and Southeast Asian countries
happy_asia <- currentHappy %>% subset(Region %in% ("East Asia") | Region %in% ("Southeast Asia"))
happy_asia <- happy_asia %>% rename("GDP" = "GDP Per Capita",
                                    "Social"= "Social Support")

top_happy <- currentHappy %>% slice_max(Happiness)
bottom_happy <- currentHappy %>% slice_min(Happiness)
mean_happy <- mean(currentHappy$Happiness)

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
