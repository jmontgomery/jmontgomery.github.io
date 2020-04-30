############################################################
#################### UI for Senate Polls ###################
############################################################
library(shiny)
shinyUI(fluidPage(  
  titlePanel("2016 Senate Polling"), ## Setting the title
  sidebarLayout( 
    sidebarPanel(
      selectInput(inputId = "stateSelect", # Different input
                  label = "Choose state to display",
                  choices=c("MO"="Missouri",
                            "FL"="Florida",
                            "NC"="North Carolina",
                            "IA"="Iowa"
                  ),
                  multiple=FALSE
      ), # End of selectInput
      checkboxInput(inputId = "points", label="Add points?", 
                    value = FALSE)
    ), ## End of sidebar
    mainPanel(  ## putting the main output here
      plotOutput("trendPlot")
    ) # Close main panel
  ) 
))
