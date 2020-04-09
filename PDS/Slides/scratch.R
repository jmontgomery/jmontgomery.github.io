library(dplyr)
library(rvest)


gs_url<-"https://scholar.google.com/scholar?hl=en&as_sdt=7%2C26&q=political+parties&btnG="
pg1<-gs_url%>%
  read_html()%>%
  html_nodes(".gs_ri a , .gs_a , .gs_rt") %>%
  html_text()

pg1

pg1<-gs_url%>%
  read_html()%>%
  html_nodes('#gsc_authors_bottom_pag .gs_ico') %>%
  html_attr("href")


pg1[[2]]



test_url<-"https://ballotpedia.org/United_States_Senate_elections_in_Arkansas,_2014"




arkansas_page<-read_html(test_url)



structure<-arkansas_page %>% 
  html_structure()

## Let's just read in the main page
mainText<-arkansas_page %>%
  html_nodes('p') %>%
  html_text()
mainText[83:91]

## How 'bout that top table
table<-arkansas_page %>%
  html_nodes('center table') %>%
  html_table()
table


## Another approach looking at page source
table<-arkansas_page %>%
  html_nodes('table.collapsible') %>%
  html_table(fill=TRUE)
table

## Another version
table<-arkansas_page %>%
  html_nodes('table.wikitable') %>%
  html_table()
table

## Get this version (found with inspector gadget)
table<-arkansas_page %>%
  html_nodes('.wikitable center , .wikitable th') %>%
  html_text()
table

# (use inspector gadget)
primaryDate<-arkansas_page %>% 
  html_nodes('td:nth-child(2) center') %>%
  html_text()
primaryDate

## Let's just get the cooks rating 
cooksScore<-arkansas_page %>%
  html_nodes('br~ b') %>%
  html_text()
cooksScore


stateLinks<-arkansas_page %>%
  html_nodes('small center a') %>%
  html_attr('href')
stateLinks









table

tables<-test_url %>%
  read_html() %>%
  html_nodes('table.collapsible"') %>%
  html_table(fill)




View(tables[[1]])


# STEP 1 - URL COMPONENTS TO SCRAPE FROM
senate_base_url <- "https://ballotpedia.org/United_States_Senate_elections_in_"
senate_state_urls <- gsub(" ", "_", state.name) 
senate_year_urls <- c(",_2012", ",_2014", ",_2016")

test_url<-"https://ballotpedia.org/United_States_Senate_elections_in_Georgia,_2014"





### Now let's get all of the years

test_data <- read_html(test_url)
something <- test_data %>% html_nodes("center") %>% html_text()  
states<-str_split(something[5], " ")[[1]]
gsub("[^[:alnum:]]","",states)  # thanks stack overflow!

collapsedtable<-test_data %>% html_nodes("table.collapsible") %>% 
  html_table(fill=TRUE)  

### Test 2

test2<-"https://ballotpedia.org/United_States_Congress_elections,_2014"
test_data2 <- read_html(test2)
something <- test_data2 %>% html_nodes("infobox")  
something


?html_table

html_nodes(//*[@id="mw-content-text"]/table[1]/tbody/tr[5]/td/small/center)


collapsedtable[[1]]
collapsedtable[[5]]
