## Factor Analysis, The R Book, pp 735
## With principal components analysis we were fundamentally interested in the variables and their contributions. Factor analysis aims to provide usable numerical values for quantities such as intelligence or social status that are not directly measurable. The idea is to use correlations between observable variables in terms of underlying ‘factors’. N

## Compared with PCA, the variables themselves are of  relatively little interest in factor analysis; it is an understanding of the hypothesized underlying factors that is the main aim.
##The idea is that the correlations amongst the variables are explained by the common factors. The function 'factanal'  in R performs maximum likelihood factor analysis on a covariance matrix or data matrix. The pgd dataframe is introduced on p. 732. 
pgdata <- read.delim("~/TheRBook/pgfull.txt")
View(pgdata)
names(pgdata)
## We need to extract the 54 variables that refer to the species’ abundances and leave behind the variables containing the experimental treatments (plot and lime) and the covariates (species                                                                                   richness, hay biomass and soil pH). This creates a smaller dataframe containing all 89 plots (i.e. all the rows) but only columns 1 to 54 (see p. 742 for details):
pgd<-pgdata[,1:54]

## You need to specify the number of factors you want to estimate – we begin with 8:
model = factanal(pgd, 8)

## On factor 1 you see strong positive correlations with AE, AP and AS and negative correlations with AC, AO and FR: this has a natural interpretation as a gradient from tall neutral grassland (positive correlations) to short, acidic grasslands (negative correlations). 

##On factor 2, low-growing species associated with moderate to high soil pH (AM, CF, HP, KA) have large positive values and low-growing acid-loving species (AC and AO) have negative values. Factor 3 picks out the key nitrogen-fixing (legume) species LP and TP with high positive values. And so on.

## Note that the loadings are of length 54 (the number of variables) not 89 (the number of rows in the dataframe representing the different plots in the experiment), so we cannot plot the loadings against the covariates as we did with PCA (p. 734). However, we can plot the factor loadings against one another:
par(mfrow=c(2,2))
plot(loadings(model)[,1],loadings(model)[,2],pch=16,xlab="Factor 1", ylab= "Factor 2")
plot(loadings(model)[,1],loadings(model)[,3],pch=16,xlab="Factor 1", ylab= "Factor 3")
plot(loadings(model)[,1],loadings(model)[,4],pch=16,xlab="Factor 1", ylab= "Factor 4")
plot(loadings(model)[,1],loadings(model)[,5],pch=16,xlab="Factor 1", ylab= "Factor 5")

## What factanal does would conventionally be described as exploratory, not confirmatory, factor analysis. For the latter, try the sem package:
install.packages("sem")
library(sem)
?sem