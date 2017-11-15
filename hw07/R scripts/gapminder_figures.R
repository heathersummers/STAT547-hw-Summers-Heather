## Generate figures
library(tidyverse)
library(ggplot2)

#import the data created in the first script
gap_dat <- read.delim("gapminder_clean.tsv")

#for each continent I created a life expectancy vs. year for the two best countries (i.e. smallest std.error) and two worst countries (i.e. largest std.error)

#creating a figure of life expectancy vs. year for Africa
country_Africa <- filter(gap_dat, country%in%c("Equatorial Guinea", "Mauritania", "Swaziland", "Zimbabwe"))
(figure_Africa <- ggplot(country_Africa, aes(x = year, y = lifeExp)) +
  facet_wrap(~ country) +
  geom_point() +
  geom_smooth(se=FALSE, span=1, method="loess") +
  labs(title = "Life Expectancy vs. Year for Africa", x = "Year", y = "Life Expectancy (Year)"))
ggsave("Life_Expectancy_of_Africa.png", width=10, height=6, plot=figure_Africa)

#creating a figure of life expectancy vs. year for Asia
country_Asia <- filter(gap_dat, country%in%c("Israel", "Pakistan", "Iraq", "Cambodia"))
(figure_Asia <- ggplot(country_Asia, aes(x = year, y = lifeExp)) +
    facet_wrap(~ country) +
    geom_point() +
    geom_smooth(se=FALSE, span=1, method="loess") +
    labs(title = "Life Expectancy vs. Year for Asia", x = "Year", y = "Life Expectancy (Year)"))
ggsave("Life_Expectancy_of_Asia.png", width=10, height=6, plot=figure_Asia)

#creating a figure of life expectancy vs. year for Americas
country_Americas <- filter(gap_dat, country%in%c("Canada", "Argentina", "El Salvador", "Jamaica"))
(figure_Americas <- ggplot(country_Americas, aes(x = year, y = lifeExp)) +
    facet_wrap(~ country) +
    geom_point() +
    geom_smooth(se=FALSE, span=1, method="loess") +
    labs(title = "Life Expectancy vs. Year for the Americas", x = "Year", y = "Life Expectancy (Year)"))
ggsave("Life_Expectancy_of_Americas.png", width=10, height=6, plot=figure_Americas)

#creating a figure of life expectancy vs. year for Europe
country_Europe <- filter(gap_dat, country%in%c("Sweden", "Switzerland", "Bulgaria", "Montenegro"))
(figure_Europe <- ggplot(country_Europe, aes(x = year, y = lifeExp)) +
    facet_wrap(~ country) +
    geom_point() +
    geom_smooth(se=FALSE, span=1, method="loess") +
    labs(title = "Life Expectancy vs. Year for Europe", x = "Year", y = "Life Expectancy (Year)"))
ggsave("Life_Expectancy_of_Europe.png", width=10, height=6, plot=figure_Europe)

#creating a figure of life expectancy vs. year for Oceania
country_Oceania <- filter(gap_dat, continent=="Oceania")
(figure_Oceania <- ggplot(country_Oceania, aes(x = year, y = lifeExp)) +
    facet_wrap(~ country) +
    geom_point() +
    geom_smooth(se=FALSE, span=1, method="loess") +
    labs(title = "Life Expectancy vs. Year for Oceania", x = "Year", y = "Life Expectancy (Year)"))
ggsave("Life_Expectancy_of_Oceania.png", width=10, height=6, plot=figure_Oceania)