## Download the data

library(downloader)
download.file(url = "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv", destfile="gapminder.tsv")


## Perform exploratory analyses

library(dplyr)
library(ggplot2)
library(forcats)
library(viridis)

#bring the data in as data frame
gap_dat <- read.delim("gapminder.tsv")

#descriptive plots of life expectancy for each continent
lifeexp_continent_boxplot <- ggplot(gap_dat, aes(x = continent, y = lifeExp)) +
  geom_boxplot(fill = "grey") +
  labs(title = "Life Expectancy vs Continent", x = "Continent", y = "Life Expectancy (Year)") +
  theme_bw() +
  theme(axis.title = element_text(size=14),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=16, hjust = 0.5))
print(lifeexp_continent_boxplot)
ggsave("Life_Expectancy_vs_Continent_Boxplot.png", width=12, height=10, plot=lifeexp_continent_boxplot)


lifeexp_continent_facetwrap <- ggplot(gap_dat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(lwd = 1, show.legend = FALSE) +
  facet_wrap(~continent) +
  aes(colour = country) +
  scale_colour_manual(values = country_colors) +
  scale_y_continuous("Life Expectancy (Year)", position="left") +
  labs(x="Year", title="Life Expectancy over Time Within the Continents") +
  theme_bw(base_size=12) +
  theme(strip.background = element_rect(fill="lightgrey"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"),
        plot.title = element_text(size=16, hjust = 0.5),
        panel.spacing = unit(1.1, "lines")) 
print(lifeexp_continent_facetwrap)
ggsave("Life_Expectancy_vs_Continent_Facetwrap.png", width=12, height=10, plot=lifeexp_continent_facetwrap)
  

old_levels <- levels(gap_dat$continent)
old_levels

#reorder continents based on life expectancy and arrange the data on continent, country, life expectancy, year
new_levels <- gap_dat %>%
  mutate(continent = fct_reorder(continent, lifeExp)) %>%
  select(continent, country, lifeExp, year) %>%
  arrange(continent, country, lifeExp, year) %>%
  droplevels()

head(levels(new_levels$continent))

#write data to file
write.table(new_levels, "gapminder_clean.tsv", quote = FALSE, sep = "\t", row.names = FALSE)
