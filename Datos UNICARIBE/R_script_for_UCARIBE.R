# R script for data mining <Seleccion de Aspirantes 2015.csv>
seleccion_uno = read.table("Selección de Aspirantes 2015.csv", header = TRUE, sep = ",", na.strings = "ND")

# Do not use the following code cause there three lines at last in csv file
seleccion_prueba = read.table("Seleccion-prueba.csv", header = TRUE, sep = ",", na.strings = "ND")
attach(seleccion_uno)
Escuela.de.Origen

## Continue here...
vista1 = seleccion_uno[, c(1,2,5:11, 21,22,24, 28, 29, 31:37, 39, 41, 43, 46)]
summary(vista1)
# What is the average score of accepted students (Aceptado == TRUE) vs the average score of non-accepted (Aceptado == FALSE)
## (In words is the average of the student a factor for acceptance?)

## Solution
# View the columns Aceptado and Promedio where Aceptado = T or F
vista1[Aceptado == TRUE, c("Aceptado", "Promedio")]
vista1[Aceptado == FALSE, c("Aceptado", "Promedio")]

## Solution - Obtain the mean of each and compare both
mean(vista1[Aceptado == TRUE, "Promedio"])
mean(vista1[Aceptado == FALSE, "Promedio"])

## Solution (Plot the corresponding HISTOGRAMS and check if they overlap)
## They do overlap
par(mfrow=c(1,2))
hist(vista1[Aceptado == TRUE, "Promedio"], xlim=c(600, 1400), xlab="Accepted")
hist(vista1[Aceptado == FALSE, "Promedio"], xlim=c(600, 1400), xlab = "Non Accepted")
par(mfrow=c(1,1))

# Correlation or not in vista2
vista2 = vista1[, c(9,16:25)]
pairs(vista2)

# Correlation in R
cor(vista2, use="complete.obs", method="pearson") 

# Linear regression in R
#

#
plot(Global.Ceneval, Promedio.Bachillerato, col="red", xlab="Explanatory variable (Global.Ceneval)",ylab="Response variable(Promedio.Bachillerato)")
abline(lm(Promedio.Bachillerato~Global.Ceneval))


z = lm(Global.Ceneval ~ Promedio.Bachillerato)
z
summary(z)   


# Barplots in R
counts <- table(vista1$Nivel)
barplot(counts, main="Level Distribution", horiz=TRUE)

counts2 <- table(vista1$Aceptado)
barplot(counts2, main="Level Accepted", horiz=TRUE)

barplot(counts14, main="Level Diagnostico", horiz=TRUE, 	legend = rownames(counts14), col=c("darkblue","red", "green", "blue", "brown"), 
beside=FALSE)

## Lattice package in R
## See pp. 
install.packages("lattice")
require(lattice)
barchart(yield ~ variety | site, data = barley,
         groups = year, layout = c(1,6), origin = 0,
         ylab = "Barley Yield (bushels/acre)",
         scales = list(x = list(abbreviate = TRUE,
                                minlength = 5)))

## Another Lattice program
## See the document "lattice-intro.pdf"
install.packages("mlmRev")
library(mlmRev)

data(Chem97, package = "mlmRev")
head(Chem97)
histogram(~ gcsescore | factor(score), data = Chem97)
densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
            plot.points = FALSE, auto.key = TRUE)

## Finish here


test2 = lm(Aceptado ~ Promedio) 
plot(test2)

attach(vista1)

# Query an Excel file in R
# Not available in Ubuntu!!
install.packages("RODBC")
require(RODBC)
conn = odbcConnectExcel("Selección de Aspirantes 2015.xls") # open a connection to the Excel file
sqlTables(conn)$TABLE_NAME # show all sheets
df = sqlFetch(conn, "Sheet1") # read a sheet
df = sqlQuery(conn, "select * from [Sheet1 $]") # read a sheet (alternative SQL sintax)
close(conn) # close the connection to the file
