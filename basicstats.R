# Basic stats

x <- ceiling(rnorm(10000, mean = 60, sd = 20))
mean(x)
median(x)

#there is no mode function for mode stats
table(x)
sort(table(x), decreasing = T)

library(modeest)
mlv(x, method = 'shorth')

quantile(x)
quantile(x, seq(.1,1,by=.1)) #decile
quantile(x,seq(.01,1,by=0.01)) #percentile

library(e1071)
plot(density(x))
e1071::skewness(x)
kurtosis(x)

sd(x)
cov(women$weight, women$height)
cor(women$weight,women$height)

stem(x)

#freq table
library(fdth)
ftable1 <- fdt(x)
ftable1
