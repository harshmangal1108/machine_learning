### Reading a DATASET
nyc<-read.csv("/home/harsh/Downloads/nyc.csv")
View(nyc)
head(nyc)
### Scatter plot 
plot(nyc,main="Pairwise Scatter Plot")
### Find Correaltion
round(cor(nyc),3)
#### MODEL BUILDING
 nycmod_1 <- lm(Price~.,data=nyc) ### here '.' indicates that all other variables to be considered
 ## or to specify which to use
 ## nycmod_1<-lm(Price~Food+Decor+Service+East,data=nyc)
## SUMMARY 
 summary(nycmod_1)
### Since service is not needed its not important criteria in our model building so droping service parameter and build new model
 nycmod_2<-lm(Price~Food+Decor+East,data=nyc)
 summary(nycmod_2)
###Dropiing Food
 nycmod_3<-lm(Price~Service+Decor+East,data=nyc)
 summary(nycmod_3)
 