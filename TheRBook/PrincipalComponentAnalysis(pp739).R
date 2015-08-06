## 'The R Book', Principal Component Analysis pp 731 

## The following dataframe contains mean dry weights (g) for 54 plant species on 89 plots, averaged over 10 years; see Crawley et al. (2005) for species names and more background. The question is what are the principal components and what environmental factors are associated with them?
pgdata <- read.delim("~/TheRBook/pgfull.txt")
View(pgdata)
names(pgdata)
## We need to extract the 54 variables that refer to the species’ abundances and leave behind the variables containing the experimental treatments (plot and lime) and the covariates (species                                                                                   richness, hay biomass and soil pH). This creates a smaller dataframe containing all 89 plots (i.e. all the rows) but only columns 1 to 54 (see p. 742 for details):
pgd<-pgdata[,1:54]
## There are two functions for carrying out PCA in R. The generally preferred method for numerical accuracy is prcomp (where the calculation is done by a singular value                                   decomposition of the centred and scaled data matrix, not by using eigen on the covariance matrix, as in the alternative function princomp). The aim is to find linear combinations of a set of variables that maximize the variation contained within them, thereby displaying most of the original variation in fewer dimensions. These principal components have a value for every one of the 89 rows of the dataframe. By contrast, in factor analysis (see p. 735), each factor contains a contribution (which may in  some cases be zero) from each variable, so the length of each factor is the total number of variables (54 in the current example). This has practical implications, because you can plot the principal components against other explanatory variables from the dataframe, but you cannot do this for factors because the factors are of length 54 while the covariates are of length 89.
## You need to use the option scale=TRUE because the variances are significantly different for the 54 plant species:
model<-prcomp(pgd,scale=TRUE)
summary(model)
## You can see that the first principal component (PC1) explains 16.7% of the total variation, and PC1–PC6 explain more than 50% of the total variation. Here is the plot of this model, showing the relative importance of PC1.
plot(model, main='')
## This is called a scree plot in PCA because it is supposed to look like a cliff face on a mountainside (on the left), with a scree slope below it (the tail on the right). The standard practice is to assume that you need sufficient principal components to account for 90 % of the total variation (but that would take 24 components in the present case). Principal component loadings show how the original variables (the 54 different species in our example) influence the principal components.

## In a biplot, the original variables are shown by arrows (54 of them in this case):
biplot(model)
## The numbers represent the rows in the original dataframe, and the directions of the arrows show the relative loadings of the species on the first and second principal components.

## Thus, the species AP, AE and HS have strong positive loadings on PC1 and LC, PS BM and LO have strong negative loadings. PC2 has strong positive loadings from species AO and AC and negative loadings from TF, PL and RA.

## If there are explanatory variables available, you can plot these against the principal components to look for patterns. In this example, it looks as if the first principal component is associated with increasing biomass (and hence increasing competition for light) and as if the second principal component is associated with declining soil pH (increasing acidity):
## Usa el modelo 'model' obtenido para predecir
## el valor de coeficientes respecto a PC1 y PC2?
yv<-predict(model)[,1]
yv2<-predict(model)[,2]
par(mfrow=c(2,2))
## Contrasta el principal component PC1 con Biomass (cantidad de heno, 'hay')
plot(pgdata$hay,yv,pch=8,xlab="biomass",ylab="PC 1")
## Se observa que hay correlacion positiva
## Contrasta el principal component PC2 con Soil (PH del suelo)
plot(pgdata$pH,yv2,pch=8,xlab="soil pH",ylab="PC 2")
## Se observa que hay correlacion negativa

## Reestablece la pantalla de graficacion
par(mfrow=c(1,1))


