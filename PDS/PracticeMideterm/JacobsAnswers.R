## Code written by Jacob Montgomery for practice midterm.  
## Last edited 2/25/20


## Preliminaries
library(tidyverse)

## Read in raw data
stateData<-read_csv('http://ippsr.msu.edu/sites/default/files/correlatesofstatepolicyprojectv2_1.csv')


## Let's take a look at the data

table(stateData$state) ## 118 observations per state
table(stateData$year) ## 51 observations per year
table(table(stateData$state, stateData$year)) # only one observation for each state/year


plot(stateData$undocumented_immigrants~stateData$immig_laws_restrict)
