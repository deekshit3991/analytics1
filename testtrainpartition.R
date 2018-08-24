# partition the data into train and test

str(mtcars)
library(caret)
#index <- createDataPartition(y=mtcars$am,p=0.7,list = F)
#The above is typically used for classification regression

index <- sample(x=1:nrow(mtcars), size = 0.7*nrow(mtcars))

train <- mtcars[index,]
test <- mtcars[-index,]
nrow(train)
nrow(test)

library(olsrr)
fit <- lm(mpg~disp+hp+wt+qsec, data=train)
k <- ols_step_all_possible(fit)
plot(k)
k

finalmodel <- lm(mpg~wt+hp, data=train)
predictedvalues <- predict(finalmodel, ndata = test)
cbind(test$mpg,predictedvalues)

# A library to check whether the assumptions are fulfilled or not
library(gvlma)
gvmodel <- gvlma(finalmodel)
gvmodel



