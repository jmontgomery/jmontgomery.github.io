### R Selenium example: Make sure you load the Rselenium library, tidyvers, rvest, and plyr

## This works for me for getting a server running
rsDriver(browser="chrome", port=4445L)
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "chrome"
)
remDr$getStatus() #check your status
remDr$open() # open up the browser


## Direct navigation
remDr$navigate("https://www.courts.mo.gov/casenet/base/welcome.do")
remDr$navigate("https://www.courts.mo.gov/casenet/cases/searchCases.do?searchType=date")

## Stardard browsing behavior
remDr$goBack()
remDr$goForward()
remDr$getCurrentUrl()
remDr$refresh()

## Finding an element on the page
thisElement<-remDr$findElement(using = "name", value="courtId" )
thisElement$getElementAttribute("name")
thisElement$getElementAttribute("id")
thisElement$getElementAttribute("class")

## A useful visual tool
thisElement$highlightElement()

## Let's try and find some other elements on this page
thisElement2<-remDr$findElement(using="name", value='inputVO.startDate')
thisElement2$getElementAttribute("id")

thisElement3<-remDr$findElement(using="xpath", value='//*[(@id = "StatusD")]')
thisElement3$getElementAttribute("id")

### Sending key presses and clicks
thisElement2$sendKeysToElement(list("02/01/2020"))

thisElement4<-remDr$findElement(using="xpath", value='//*[@id="courtId"]/option[26]')
thisElement4$clickElement()

thisElement5<-remDr$findElement(using="xpath", value='//*[@id="inputVO.caseType"]/option[2]')
thisElement5$clickElement()

findButton<-remDr$findElement(using="name", value="findButton")
findButton$clickElement()


## Now let's actually get some of the data we came for

remDr$getPageSource()[[1]] %>%
  read_html() %>%
  html_nodes('tr~ tr+ tr tr tr td') %>%
  html_text()

### Just grabbing this for something else below.
save.this.for.later<-remDr$getPageSource()[[1]] %>%
  read_html()


## now let's walk through the pages

nextPage<-remDr$findElement(using="xpath", value='/html/body/table/tbody/tr[5]/td/table/tbody/tr/td[11]/a')
nextPage$clickElement()

#### Digging into the html we see they are using javascript, so maybe we could instead do this ...
#<a style="visibility:visible; color:blue; font-size:8pt; text-decoration:underline; cursor:pointer; font-weight:normal" href="javascript:goToThisPage(21);">[Next 10 of 62]</a>
  
remDr$executeScript('goToThisPage(40)')


### For that matter can get a lot more of the data that way

#<a href="javascript:goToThisCase('20SL-CC00807', 'CT21');">  20SL-CC00807 </a>

remDr$executeScript("goToThisCase('20SL-CC00807', 'CT21')") # navigage
remDr$getPageSource()[[1]] %>% #scrape
  read_html() %>% 
  html_nodes('table.detailRecordTable') %>%
  html_table()


## Let's go and get all of the cases we were looking at before
savedOutput<-save.this.for.later %>%
  html_nodes('tr~ tr+ tr tr tr td') %>%
  html_text()

## Some quick cleaning to get rid of 
cases<-savedOutput[seq(9, 93, by=6)]
cases<-gsub(c("\t"), "", cases) 
cases<-gsub(c("\n"), "", cases) 
cases<-str_trim(cases, side="right")
cases

remDr$goBack() # Get back to the starting page
## A function that goes through the navigation/scraping steps
grabCaseDetails<-function(x){
    string<-paste0("goToThisCase('", x, "', 'CT21')")
    remDr$executeScript(string)
    output<-remDr$getPageSource()[[1]] %>%
       read_html() %>% 
        html_nodes('table.detailRecordTable') %>%
        html_table
    remDr$goBack()
  return(output)
}

## Let's apply this across all of the cases of interest
caseDetails<-llply(cases, grabCaseDetails)
caseDetails

grabCaseDetails(cases[6])

### Hmm ... maybe going to fast?

grabCaseDetails<-function(x){
  string<-paste0("goToThisCase('", x, "', 'CT21')")
  Sys.sleep(2) # pause for 2 seconds
  remDr$executeScript(string)
  output<-remDr$getPageSource()[[1]] %>%
    read_html() %>% 
    html_nodes('table.detailRecordTable') %>%
    html_table
  Sys.sleep(1) # pause for 1 second
  remDr$goBack()
  return(output)
}

caseDetails<-llply(cases, grabCaseDetails)
caseDetails ## better, if slower

