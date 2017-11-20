library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(DT) #package allows `DataTables` to be filtered, sorted, and divided into discrete pages
library(shinythemes) #to alter the appearance of the app
library(colourpicker)

bcl <- read.csv("bcl_data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  theme = shinytheme("readable"),
  img(src = "BCliquor_logo.jpg", width="450x"),
  titlePanel("BC Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      checkboxGroupInput("typeInput", "Product type(s):",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      
      uiOutput("countryOutput")
    ),

  mainPanel(
      downloadButton("download", "Download results table"),
      br(), br(),
      plotOutput("coolplot"),
      br(), br(),
      DT::dataTableOutput("results")
    )
  )
)