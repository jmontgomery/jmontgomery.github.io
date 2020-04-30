library(shiny)  ## Load shiny
shinyUI(fluidPage( ## Flexible layout function 
  titlePanel("Minimial App"), ## Setting the title
  sidebarLayout( ## Choosing layout with inputs on side and 
                 ## outputs displayed in the main body
    sidebarPanel( #Things in this function specify the sidebar
       textInput(inputId = "comment", 
                   label = "What you want?",
                   value=""
    )), ## End of sidebar
    mainPanel( ## Arguments for main section (output)
      h3("This is what you said"), # A subtitle
                                 # Notice the comma
      textOutput("textDisplay")
    ) # Close main panel
  ) #
))
