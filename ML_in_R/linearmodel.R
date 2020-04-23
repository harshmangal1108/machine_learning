### Load the data from text file into tabular formats
bonds<-read.delim("/home/harsh/Downloads/bonds.txt",row.names = 1)
View(bonds) ##Viewing data 
head(bonds) ##first six
tail(bonds) ## last six 

### structure of data -- each variable and its data type
str(bonds)
### summary of data 
summary(bonds)

##visualize the data
plot(bonds$CouponRate,bonds$BidPrice,
     main="Bid Price vs Coupon Rate",
     xlab = "coupon rate",
     ylab = "Bid price")
### Build a linear regression model
bondsmo<-lm(bonds$BidPrice~bonds$CouponRate) 
#or  lm(Bidprice~Couponrate,data=bonds)
### fitting regression line
abline(bondsmo)
### summary of model
summary(bondsmo)

######### MODEL ASSISMENT
#### Residul analysis
plot(bondsmo$fitted.values,rstandard(bondsmo),
     main="Residual plot",
     xlab="Predicted value for Bid price",
      ylab="standard residuals")
abline(h=2,lty=2)
abline(h=-2,lty=2)

### identify the  indices of outliers these samples
identify(bondsmo$fitted.values,rstandard(bondsmo))
### removing outliers
bonds_new<-bonds[-13,]
bondsmo1<-lm(bonds_new$BidPrice~bonds_new$CouponRate)
summary(bondsmo1)
bonds_new<-bonds[-4,]
bondsmo1<-lm(bonds_new$BidPrice~bonds_new$CouponRate)
summary(bondsmo1)
bonds_new<-bonds[-34,]
bondsmo1<-lm(bonds_new$BidPrice~bonds_new$CouponRate)
summary(bondsmo1)
bonds_new<-bonds[-35,]
bondsmo1<-lm(bonds_new$BidPrice~bonds_new$CouponRate)
summary(bondsmo1)
### after removing otliers 
plot(bonds$CouponRate[-c(4,13,34,35)],
     bonds$BidPrice[-c(4,13,34,35)],
     main="Bid price vs coupon rate without outliers",
     xlab="coupon rate",
     ylab="bid price")

abline(bondsmo1)
 