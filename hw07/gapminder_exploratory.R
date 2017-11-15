## Download the data

library(downloader)
download.file(url = "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv", destfile="gapminder.tsv")


## Perform exploratory analyses

library(dplyr)
library(ggplot2)
library(forcats)


gap_dat <- read.delim("gapminder.tsv")
View(gap_dat)


old_levels <- levels(gap_dat$continent)
old_levels

#reorder continents based on life expectancy and arrange the data on continent, country, life expectancy, year
new_levels <- gap_dat %>%
  mutate(continent = fct_reorder(continent, lifeExp)) %>%
  select(continent, country, lifeExp, year) %>%
  arrange(continent, country, lifeExp, year) %>%
  droplevels()

head(levels(new_levels$continent))
glimpse(new_levels)

#write data to file
write.table(new_levels, "gapminder_clean.tsv", quote = FALSE, sep = "\t", row.names = FALSE)
