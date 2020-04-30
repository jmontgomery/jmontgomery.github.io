############################################################
#################### UI for Senate Polls ###################
############################################################
library(shiny)
shinyUI(fluidPage(  
  titlePanel("2016 Senate Polling"), ## Setting the title
  sidebarLayout( 
    sidebarPanel(
       selectInput(inputId = "stateSelect", 
                   label = "Choose state to display",
                   choices=c("MO"="Missouri",
                             "FL"="Florida",
                             "NC"="North Carolina",
                             "IA"="Iowa"
                   ),
                   multiple=FALSE
    )), ## End of sidebar
    mainPanel( 
      plotOutput("trendPlot")
    ) # Close main panel
  ) 
))
