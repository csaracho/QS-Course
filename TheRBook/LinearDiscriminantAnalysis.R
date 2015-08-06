## As http://www.youtube.com/watch?v=bOSVge_PQF4
## Linear Discriminant Analysis

flea.df <- read.csv("~/Interactive_with_R_and_GGobi/datasets/flea.csv", header=T)
View(flea.df)
head(flea.df)
## Scatter plot matrix
require(lattice)
splom(flea.df[, 1:5], groups = flea.df$species)

## Linear Discriminant Analysis
require(MASS)
attach(flea.df)
flea.lda = lda(flea.df$species ~ tars1 + tars2 + head + aede1 + aede2 + aede3, data = flea.df)
## Asomarse al model lda obtenido
flea.lda
## Predecir el valor de 'species'
species.pred = predict(flea.lda)

table(flea.df$species, species.pred$class)

lda.temp = data.frame(species.pred$x, class = species.pred$class)
xyplot(LD1 ~LD2, data = lda.temp, groups = class)