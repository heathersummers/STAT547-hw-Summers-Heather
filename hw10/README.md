## STAT545 Homework 10
[Return to Main Page](https://github.com/heathersummers/STAT547-hw-Summers-Heather)

This folder contains homework assignment #10 for Heather Summers.

For the completed homework 10 please see the [Markdown file]() and the [R Markdown file](). Also a link to the instructions for this assignment can be found on the [STAT545 Website](http://stat545.com/hw10_data-from-web.html). API came from this [website](https://openweathermap.org/current#cities). 

For this homework I used the package `httr` to aquire data from the [OpenWeatherMap API](https://openweathermap.org/current#cities) and merged the data into a single data frame with weather information for several cities around Canada. To get the data from the API it required a key so to preserve the security of the authorization key, reviewers will need to [sign up](https://home.openweathermap.org/users/sign_up) to get a key in order to run the code and see the resulting tables and plots.

### Reflection on the Process:
I found this assignment quite difficult and found it much harder to figure out what was wrong or how to fix the code when error messages came up. Something I found difficult was when joining the list of data frames I wanted to use the function `reduce` from the `purrr` package but the format of the output did not work out well (i.e. data did not join well). I also wanted to come up with a function that would be able to simplify the data frames so that I don't have to make different ones for each city, I am sure there is a way but I was unsuccessful in creating a function.

#### Useful Links:
- [Accessing APIs from R](https://www.r-bloggers.com/accessing-apis-from-r-and-a-little-r-programming/)

- [Joining A List of Data Frames](https://www.rdocumentation.org/packages/plyr/versions/1.8.4/topics/join_all)

- [API Developer Guide](https://developer.github.com/v3/)

- [Current weather data](https://openweathermap.org/current#cities)

- [Notes from class](http://stat545.com/111Scraping_Workthrough.html)

