### KNN algorithm
install.packages('class',dependencies = TRUE)
library(caret) # for confusion matrix
library(class) # for KNN
servicetrain<-read.csv("serviceTrainData.csv")
servicetest<-read.csv("serviceTestData.csv")
### structure 
str(servicetrain)
str(servicetest)
### summary
summary(servicetrain)
summary(servicetest)
### implementation of knn
predictknn<-knn(train = servicetrain[,-6],
                test = servicetest[,-6],
                cl = servicetrain$Service,
                k=3)
predictknn
### confusion matrix
### finding it manually
conf_matrix=table(predictknn,servicetest[,6])
conf_matrix
## accuracy calculation manually
knn_accuracy=sum(diag(conf_matrix))/nrow(servicetest)
knn_accuracy
### automatically confusion matrix
conf.matrix<-confusionMatrix(data = predictknn,servicetest$Service)
print(conf.matrix)
