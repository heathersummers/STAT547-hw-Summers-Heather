## Perform statistical analyses

library(tidyverse)
library(dplyr)
library(ggplot2)
library(broom)

#import the data created in the first script
gap_dat <- read.delim("gapminder_clean.tsv")

#create a nested data frame
gap_nested <- gap_dat %>%
  group_by(continent, country) %>%
  nest()

#fit a linear regression of life expectancy on year within each country
life_vs_yr <- function(g_dat) {
  lm(lifeExp ~ I(year - 1952), data = g_dat)
}

#get the estimated coefficients for each country
(gap_coefficients <- gap_nested %>%
  mutate(fit = map(data, life_vs_yr),
         clean = map(fit, tidy)) %>%
  select(continent, country, clean) %>%
  unnest(clean))

#calculate the standard deviation of each linear model
sd_linearmodel <- function(fit){
  summary(fit)$sigma
}

(gap_sd <- gap_nested %>%
  mutate(fit = map(data, life_vs_yr),
         sd = map(fit,sd_linearmodel)) %>%
  select(continent, country,sd) %>%
  unnest(sd))

#adding the standard deviation (i.e. sd) column to the output given by `tidy()` (i.e. the table with one row per parameter estimate)
gap_coefficients <- left_join(gap_coefficients, gap_sd, by = c("country"))

#write data to file
write.table(gap_coefficients, file = "gap_coefficients.tsv",quote = FALSE,
            sep = "\t", row.names = FALSE)

#I will now find the four "worst" and "best" countries for each continent (except Oceania since there are not enough countries available) based on the standard error.
#Standard error measures teh accuracy with which a sample represents a population.
#The smaller the standard error (i.e. smaller the spread) the higher the accuracy of the sample, the data is more representative of the true mean.
#The larger the standard error the less accurate the sample, the data likely has notable irregularities.

(select_Africa <- gap_coefficients %>%
  filter(continent.x =="Africa") %>%
  arrange(std.error) %>%
  filter(std.error<0.0085|std.error>3.3))

(select_Asia <- gap_coefficients %>%
    filter(continent.x =="Asia") %>%
    arrange(std.error) %>%
    filter(std.error<0.0119|std.error>1.8))

(select_Americas <- gap_coefficients %>%
    filter(continent.x =="Americas") %>%
    arrange(std.error) %>%
    filter(std.error<0.0066|std.error>0.85))

(select_Europe <- gap_coefficients %>%
    filter(continent.x =="Europe") %>%
    arrange(std.error) %>%
    filter(std.error<0.005|std.error>1.0))

best_worst_countries <- rbind(select_Africa, 
                              select_Asia, 
                              select_Americas, 
                              select_Europe,
                              filter(gap_coefficients, continent.x=="Oceania"))

#write data to file
write.table(best_worst_countries,file="best_worst_countries.tsv",quote=FALSE,
            sep = "\t", row.names = FALSE)
