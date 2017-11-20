library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(DT) #package allows `DataTables` to be filtered, sorted, and divided into discrete pages
library(shinythemes)

server <- function(input, output) {
  bcl <- read.csv("bcl_data.csv", stringsAsFactors = FALSE)

  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })  
  
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }    
    
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content, fill = Type)) + #fill colour determined by product type
      geom_histogram(colour = "black") + #black font
      theme_classic(20) + #font size is 20
      labs(title = "Alcohol Content for BC Liquor Store Products", #added a title for the plot
           x = "Alcohol Content (%)", 
           y = "Count") #changed the axis labels to be more descriptive
  })
  
  output$results <- DT::renderDataTable({
    filtered()
  })
  
#now able to download results table as a .csv file  
  output$download <- downloadHandler( 
    filename = function() { 
      "bcliquor_results.csv"
    },
    content = function(file) {
      write.csv(results(), file)
    }
  )
}