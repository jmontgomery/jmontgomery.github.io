## Introduction to R: Lecture 2

turnout.ak <- 238307/496386
print(turnout.ak)
turnout.ak


total.votes.ak <-238307
voting.age.population.ak<-496387
turnout.ak<-total.votes.ak/voting.age.population.ak
print(turnout.ak)

election<-5000000

Bears<-"Panda"

rm(Bears)
ls()


Bear1<-Bear2<-42

rm(list=c("Bear1", "Bear2"))
objects()

rm(list=ls())
ls()


.x <-42
ls()

.x+23

###

numbers5to20*2
sqrt(numbers5to20)
numbers5to20^2


numbers5to20+rev(numbers5to20)

mean(numbers5to20)

abs(c(-1, 4))
sin(c(5, 3))

vap<-voting.age.population<-c(3481823, 496387, 4582842, 2120139,26955438,
                              3617942,2673154,652189,472143,14085749,6915512,
                              995937,1073799,9600372,4732010,2265860,2068253,
                              3213141,3188765,1033632,4242214,4997677,7620982,
                              3908159,2139918,4426278,731365,1321923,1870315,1012033,
                              6598368,1452962,14838076,6752018,494923,8697456,2697855,
                              2850525,9612380,824854,3303593,594599,4636679,
                              17038979,1797941,487900,5841335,4876661,1421717,
                              4257230,392344)    

total.votes<-tv<-c(NA, 238307, 1553032, 780409,8899059,1586105, 
                   1162391,258053, 122356,4884544, 2143845,348988, 
                   458927,3586292, 1719351,1071509, 864083,1370062, 
                   954896,NA, 1809237, 2243835,3852008, 2217552,NA, 
                   2178278, 411061,610499, 586274,418550, 2315643,568597, 
                   4703830,2036451, 220479,4184072, NA,1399650, NA,392882, 
                   1117311,341105, 1868363,NA, 582561, 263025,2398589, 
                   2085074,473014, 2183155, 196217)

vap[c(3, 3, 2, 2)]

vap[-c(4:51)]

vap[c(0:4)]

x[c(-2,3)]


x*3
y<-x-5
y
x^3


y^x

tv[2:4]/vap[2:5]

####

length(tv)
length(vap)
length(tv[3:20])

log(vap[1:10])

abs(c(-1,2,-1))


var(vap)

min(tv, na.rm = T)

sort(vap)
sum(vap)

prod(vap[1:4])


!is.na(tv)


rep(1, 5)
seq(from=1, to=21, by=2)
rep(seq(2, 20, by=2), 2)

rep(c(1, 4), c(3, 2))

rep(c(1,4), each =3)
