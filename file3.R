# Data Structures


# Vectors ----
v1 <- 1:100   #create vector from 1 to 100
v2 <- c(1,3,8)
class(v1)
class(v2) #numeric is double type
v3 <- c('a','Deekshit')
v4 <- c(TRUE,FALSE)

#summary on vectors
mean(v1)
median(v1)
sd(v1)
hist(women$height)
v2[v2>=5]
x <- rnorm(600,mean = 60,sd = 10)
hist(x)
plot(density(x)) #density plot instead of a histogram
abline(v=60) # vertical line on the plot at certain x location
hist(x,breaks = 10, freq = F, col = 1:10)
lines(density(x)) # lines function to overlay histogram with density plot

x1 <- LETTERS[5:20]
set.seed(1234)
y1 <- sample(x1)
y1

#set seen is used to get the same pattern
set.seed(5)
(y2 <- sample(x1, size = 5))

# sample with replacement and give prob values for the data point
gender <- sample(c('M','F'),size = 60000, replace = TRUE, prob = c(0.6,0.4))

# To generate table of values
t1 <- table(gender)

# to show the proportion of the categories
prop.table(t1)
pie(t1)
barplot(t1, col = 1:2, horiz = T)


# Matrix ----
(m1 <- matrix(1:24,nrow = 4))
(m2 <- matrix(1:24,nrow = 4, byrow = T)) # to fill by row

x <- runif(60, min = 60, max = 100) # random uniform distribution
plot(density(x))

(x <- trunc(runif(60, min = 60, max = 100))) # trunc to remove decimals
(m4 <- matrix(x,ncol = 6))

colSums(m4) # Sum of columns
rowSums(m4) # Sum of rows

rowMeans(m4)
colMeans(m4)
m4[m4 >67 & m4<85]




# Array ----




# data.frame ----
rollno <- 1:60
name <- paste('Student',1:60,sep = '-')
gender <- sample(c('Male','Female'), size = 60, replace = T, prob = c(.3,.7))
course <- sample(c('BBA','MBA','FPM'),size = 60, replace = T, prob = c(.3,.4,.3))
marks1 <- ceiling(rnorm(60, mean = 65, sd = 7))
marks2 <- ceiling(rnorm(60, mean = 60, sd = 11))
grades <- sample(c('A','B','C'), size = 60, replace = T)

students <- data.frame(rollno,name,gender,course,marks1,marks2,grades, stringsAsFactors = F)

students[,c('name')]
students[students$gender == 'Male' & students$grades == 'A',]
barplot(table(students$course), ylim = c(0,50))
text(1:3, table(students$course)+5, table(students$course))
str(students)
nrow(students)
names(students)
dim(students)
head(students)
tail(students)
students[,c(2,4)]

# avg marks scored by each gender in marks1
aggregate(students$marks1,by = list(students$gender), FUN = mean)
aggregate(students$marks2, by = list(students$course), FUN = max)
aggregate(students$marks2, by = list(students$course, students$gender), FUN = mean)


# dplyr ----
library(dplyr)
students %>% group_by(gender) %>% summarise(mean(marks1))
students %>% group_by(course,gender) %>% summarise(mean(marks1))
students %>% group_by(gender,course) %>% summarise(mean(marks1), min(marks2), max(marks2))
students %>% group_by(gender,course) %>% summarise(meanmarks1 = mean(marks1), min(marks2), max(marks2)) %>% arrange(desc(meanmarks1))
students %>% arrange(desc(marks1)) %>% select(name) %>% head(5)
students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% head(5)
sample_frac(students,0.1,replace = F)
sample_n(students,5, replace = F)
students %>% sample_frac(0.1) %>% arrange(course) %>% select(name,gender)
students %>% sample_n(9)
students %>% arrange(marks2,marks1) %>% select(marks2,marks1)

# factor
summary(students$gender)
students$gender <- factor(students$gender)
summary(students$gender)
students$course <- factor(students$course,ordered = T,levels = c('FPM','MBA','BBA'))
summary(students$course)
# if levels is not given ordering is done alphabetically

students$grades <- factor(students$grades, ordered = T, levels = c('C','B','A'))
table(students$grades)

students
write.csv(students,'./data/iimtrichy.csv')
students2 <- read.csv('./data/iimtrichy.csv')
head(students2)
students3 <- read.csv(file.choose())
students3 <- students3[,-1]



