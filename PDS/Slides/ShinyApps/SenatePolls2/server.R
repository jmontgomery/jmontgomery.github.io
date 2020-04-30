library(shiny)
shinyServer(function(input, output) {
  
  ## This will just be executed once
  senateData<-read.csv("PollingCandidateData92-16.csv") 
  
  # This will be updated when options are changed.
  passData<-reactive({ 
    stateData<-senateData %>%
      filter(state==input$stateSelect & cycle==2016) %>%
      select(c("Poll", "daysLeft", "Candidateidentifier")) %>% 
      group_by(Candidateidentifier)
    return(stateData)
  })
  
  # Now we prepare the output
  output$trendPlot <-renderPlot({ # note brace
    thePlot<- ggplot(passData(),  # Note passData() is a function
           mapping=aes(x=daysLeft, y=Poll, color=Candidateidentifier)) +
      geom_smooth() +
      ggtitle(paste0("2016 Senate Election in ", input$stateSelect)) + 
      labs(y="Poll results", x="Days Till Election")
    if(input$points){
     thePlot<-thePlot+ geom_point() 
    }
    print(thePlot) 
  })
  
  
  }) # Close function/shinyServer call
