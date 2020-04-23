### IT is supervised approach
### clearing the environment
rm(list = ls())
## install package
#install.packages("caret",dependencies = TRUE)
library(caret)
#### reading data
crashTest_1<-read.csv("crashTest_1.csv",row.names = 1)
crashTest_1_Test<-read.csv("crashTest_1_TEST.csv",row.names = 1)
### view data
View(crashTest_1)
View(crashTest_1_Test)
### structure of data
str(crashTest_1)
str(crashTest_1_Test)
### summary
summary(crashTest_1)
summary(crashTest_1_Test)
### TRAINING DATA
##### glm is used for logistic regression
### glm is genrailised linear model
logisfit<-glm(formula = crashTest_1$CarType~.,family = 'binomial',data = crashTest_1)
logisfit

## summary
summary(logisfit)


### PREDICTION
logistrain<-predict(logisfit,type = 'response')
###3 plot the probablities
plot(logistrain)
### probablities of car type 
tapply(logistrain,crashTest_1$CarType,mean)
### prediction on test data
logispred<-predict(logisfit,newdata = crashTest_1_Test,type = 'response')
plot(logispred)
logispred
#### to check how accurately our classifier is able to classify
crashTest_1_Test[logispred<=0.5,"logispred"]<-"Hatchback"
crashTest_1_Test[logispred>0.5,"logispred"]<-"SUV"

### Confusion matrix
confusionMatrix(table(crashTest_1_Test[,7],crashTest_1_Test[,6]),positive = "Hatchback")

