# R script for steps.csv data mining
# ==========================================================================
steps = read.table('steps.csv', header=TRUE, sep=",")
summary(steps)
attach(steps)
summary(entries)
plot(date, entries)
# Plotting 365 days
days = seq(1:365)
plot(days, xlab = "days (365)", entries, ylab = "entries (steps in a day)", 
     type = "s", xlim = c(1,365), main= "Steps per day in a year")
boxplot(entries, main = "Boxplots of steps per day (one year)")
IQR(entries)
quantile(entries)
# Simple Histogram
hist(entries)
# A more elaborate Histogram depending on data nature
c = seq(from=2, to= 457, by=5)
hist(entries, main="Histogram of steps in a year (2014)", breaks = c)

# Obtaining the discrete probability distribution (PMF)
# 'results' is an object of class histogram" with several properties,
# namely: breaks, counts, density, mids, 
results = hist(entries, main="Histogram of steps in a year (2014)", breaks = c)
PMF = data.frame(results$mids, results$counts, results$density)
plot(results$mids, results$density)
plot(results$mids, results$density, type="l", col="blue")
## Esto no da 1 !!
sum(results$density)

# Obtaining samples of 1 at randmo from steps$entries
sample(steps$entries, size = 1, replace = TRUE)

# Obtaining samples of 30 at random from steps$entries
sample(steps$entries, size = 30, replace = TRUE)

# How do we make a complete year from steps dataframe?
# Hint:
jan = sample(steps$entries, size = 31, replace = TRUE)
feb = sample(steps$entries, size = 28, replace = TRUE)
new_year_2015 = c(jan, feb)
days_of_2015 = seq(as.Date("2015/01/01"), by = "days", length.out = 59)
new_year_2015 = data.frame(days_of_2015, new_year_2015)
# Change names to columns (such as the original steps dataframe)
names(new_year_2015) = c("date", "entries")


