library(shiny)
runExample("01_hello") # a histogram



###


setwd("~/GitHub/jmontgomery.github.io/PDS/Datasets/SenateForecast")

senateData<-read.csv("PollingCandidateData92-16.csv")

stateName<-"North Carolina"

stateData<-senateData %>%
  filter(state==sateName & cycle==2016) %>%
  select(c("Poll", "daysLeft", "Candidateidentifier")) %>% 
  group_by(Candidateidentifier)%>%
  glimpse()

library(ggplot2)

thisPlot<-ggplot(stateData, 
       mapping=aes(x=daysLeft, y=Poll, color=Candidateidentifier)) +
  geom_point()  + 
  geom_smooth() +
  ggtitle(paste0("2016 Senate Election in", stateName)) + 
  labs(y="Poll results", x="Days Till Election")
print(thisPlot)

###
