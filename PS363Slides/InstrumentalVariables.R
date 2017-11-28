##  Example code for IV

#install.packages("AER")
library(AER)

### Let's look at some help files
?ivreg
?CigarettesSW


### Let's run an analysis

data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

## Usual regression model 
lm1 <- lm(log(packs) ~ log(rprice) + log(rincome) ,
            data = CigarettesSW, subset = year == "1995")
summary(lm1)

## IV model
fm <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
            data = CigarettesSW, subset = year == "1995")
summary(fm)
