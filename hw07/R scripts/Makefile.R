#clean out any previous work
outputs <- c("gapminder.tsv",
             "gapminder_clean.tsv",
             "gap_coefficients.tsv",
             "best_worst_countries.tsv",
             list.files(pattern = "*.png$"),
             "hw07.Rmd")
file.remove(outputs)

#run my scripts
source("C:/Users/Heather/Documents/UBC_Graduate _School/STAT_547/STAT547-hw-Summers-Heather/hw07/gapminder_exploratory.R")
source("C:/Users/Heather/Documents/UBC_Graduate _School/STAT_547/STAT547-hw-Summers-Heather/hw07/gapminder_statistical.R")
source("C:/Users/Heather/Documents/UBC_Graduate _School/STAT_547/STAT547-hw-Summers-Heather/hw07/gapminder_figures.R")
source("C:/Users/Heather/Documents/UBC_Graduate _School/STAT_547/STAT547-hw-Summers-Heather/hw07/hw07.Rmd")

rmarkdown::render("C:/Users/Heather/Documents/UBC_Graduate _School/STAT_547/STAT547-hw-Summers-Heather/hw07/hw07.Rmd")
