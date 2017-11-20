## STAT545 Homework 08
[Return to Main Page](https://github.com/heathersummers/STAT547-hw-Summers-Heather)

This folder contains homework assignment #8 for Heather Summers.

I made improvements to the BC Liquor Store app, please see [hw08 BC Liquor Store Prices app](https://heathersummers.shinyapps.io/hw08_BC_Liquor_Store_Prices/). The dataset can be found [here](https://github.com/STAT545-UBC/STAT545-UBC.github.io/blob/master/shiny_supp/2016/bcl-data.csv). For details on the code used to make the shiny app please see the [app.R](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw08/app.R), [ui.R](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw08/ui.R), and [server.R](https://github.com/heathersummers/STAT547-hw-Summers-Heather/blob/master/hw08/server.R) documents. Also the instructions for this assignment can be found on the [STAT545 Website](http://stat545.com/hw08_shiny.html).



### New features added to the BC Liquor Store app:
- used the DT package to make beautiful, interactive tables
- used the package `shinythemes` to chnage the appearance of the app
- made the following changes to the histogram: changed the axis titles, added a title for the plot, fill colour is determined by the product type, font is black and of size 20
- allowed the user to download the results table as a .csv file using the functions `downloadButton()` and `downloadHandler()`
- allowed the user to search for multiple product types simultaneously (instead of only being able to choose one product type) using the function `checkboxGroupInput()`
- added an image of the BC liquor store logo 

### Reflection on the Process:
When choosing a shiny theme I used the live theme selector `shinythemes::themeSelector()` in order to test out different themes with the application. 

###### Useful Links:
- [Building Shiny apps](http://stat545.com/shiny01_activity.html#final-shiny-app-code)

- [Example of a Good Shiny App](https://daattali.com/shiny/bcl/)

- [Information on DT package](https://rstudio.github.io/DT/)

- [Shiny Themes](https://rstudio.github.io/shinythemes/)

- [Create a button or link](https://shiny.rstudio.com/reference/shiny/1.0.5/downloadButton.html)

- [File Downloads](https://shiny.rstudio.com/reference/shiny/1.0.5/downloadHandler.html)

- [Checkbox Group Input Control](https://shiny.rstudio.com/reference/shiny/latest/checkboxGroupInput.html)

