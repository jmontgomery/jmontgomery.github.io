# author = Mariah Yelenick
# date   = April 30, 2020
# runGist("e600b55b64cd2fc067e20622f5efc2ff")

library(bookdown)
library(shinyAce)
library(shiny)
library(shinymanager)
credentials <- data.frame(
  user = c("Mariah", "Jacob", "WUSTL"),
  password = c("Yelenick", "Montgomery", "student"),
  stringsAsFactors = FALSE
)

s = function(input, output) {
  result_auth <- secure_server(check_credentials = check_credentials(credentials))

  output$res_auth <- renderPrint({
    reactiveValuesToList(result_auth)
  })
  output$output <- renderPrint({
    input$eval
    eval(parse(text = isolate(input$code)))
  })
} 
u = secure_app(fluidPage(
    h1("Code Evaluation"),
    fluidRow(
      column(
        6,
        h2("Code"),
        aceEditor("code", mode = "r", height = "200px", value = "3+2"),
        actionButton("eval", "Evaluate")
      ),
      column(
        6,
        h2("Output"),
        verbatimTextOutput("output")
      )
    )
  ) 
)

shinyApp(server=s, ui=u, options = list(height = 500))
