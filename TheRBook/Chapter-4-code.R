## R warm up exercises for QS Applied in Education
## Chapter 4 of "The R Book"

worms<-read.table("worms.txt",header=T)
worms
## Ups
Slope

## One correct way
worms$Slope
## Or using "attach" for the 
## dataframe meaning being globally accesible 
## Through the PATH for R or RStudio
attach(worms)
## 



## Ignore the next code
N = 10000
tot_dist = 0
tot_dist = runif(N, 0, 1)*2
total = sum(tot_dist)
dist = total/N
dist