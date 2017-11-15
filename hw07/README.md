## STAT545 Homework 07
[Return to Main Page](https://github.com/heathersummers/STAT547-hw-Summers-Heather)

This folder contains homework assignment #7 for Heather Summers.

For the completed homework 07 please see the [Markdown file](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/hw07.md) and the [R Markdown file](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/hw07.Rmd). Also a link to the instructions for this assignment can be found on the [STAT545 Website](http://stat545.com/hw07_automation.html).

### Useful Links:
- [broom package](https://github.com/tidyverse/broom)

- [Automation Examples Using Just R](https://github.com/STAT545-UBC/STAT545-UBC.github.io/tree/master/automation10_holding-area/01_automation-example_just-r)

### Automate the Pipeline:
I wrote a [Makefile](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/Makefile.R) to automate my pipeline using R. The [first script](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/R%20scripts/gapminder_exploratory.R) downloads the gapminder data and then reads the data, reorders the continents based on life expectancy and then the numerical data is written to file in TSV format. The [second script](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/R%20scripts/gapminder_statistical.R) reads the output of the first script and then fits a linear regression of life expectancy on year within each country and gets the estimated intercepts, slopes, and residual error variance (or sd). In addition, the second script determines the four best and worst countries based on standard error for each continent and saves them to files. The [third script](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/R%20scripts/gapminder_figures.R) generates figures of life expectancy over time for the two best and worst countries for each continent (except the continent Oceania which creates a figure that includes the only two countries available) and saves them to files. The [fourth script](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/hw07.Rmd) is an Rmd that presents the original data, the descriptive plots, statistical summaries, and figures in a little report. The [fifth script](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw07/R%20scripts/Makefile.R) is a Makefile created to run the other scripts in sequence.

### Report Your Process:
At first, I found this assignment somewhat difficult because I kept getting errors in my code however, by following Jenny Bryan's examples I was able to overcome the small errors in the script. By completing this assignment I learned a lot about the process of automating pipelines and I hope to use Makefiles in future assignments. I found creating the figures and reordering the data quite easy since we have been working on creating quality graphs for several weeks. 

