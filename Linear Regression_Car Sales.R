#####Linear Regression - Industry Project
setwd("C:\\Users\\HP-PC\\Desktop\\Linear Regression_Industry Project_20062019\\")
CarSales<-read.csv("Car_sales.csv")
View(CarSales)

#Installing required packages
install.packages("car")
install.packages("lmtest")
install.packages("nortest")
install.packages("dplyr")
install.packages("stringr")

library(car)
library(lmtest)
library(nortest)
library(dplyr)
library(stringr)

#Looking at the Data
install.packages("summarytools")
library(summarytools)

dfSummary(CarSales)


#Cleaning the data
colnames(CarSales)<-str_replace_all(colnames(CarSales),"[_]","")

summary(CarSales)
str(CarSales)
CarSales[is.na(CarSales$Powerperffactor),13]<- mean(CarSales$Powerperffactor,na.rm = TRUE)
CarSales[is.na(CarSales$Fuelefficiency),12]<-mean(CarSales$Fuelefficiency,na.rm=TRUE)
CarSales[is.na(CarSales$Fuelcapacity),11]<-mean(CarSales$Fuelcapacity,na.rm = TRUE)
CarSales[is.na(CarSales$Curbweight),10]<-mean(CarSales$Curbweight,na.rm = TRUE)
CarSales[is.na(CarSales$Length),9]<-mean(CarSales$Length,na.rm = TRUE)
CarSales[is.na(CarSales$Width),8]<-mean(CarSales$Width,na.rm = TRUE)
CarSales[is.na(CarSales$Wheelbase),7]<-mean(CarSales$Wheelbase,na.rm = TRUE)
CarSales[is.na(CarSales$Horsepower),6]<-mean(CarSales$Horsepower,na.rm = TRUE)
CarSales[is.na(CarSales$Enginesize),5]<-mean(CarSales$Enginesize,na.rm = TRUE)
CarSales[is.na(CarSales$Priceinthousands),4]<-mean(CarSales$Priceinthousands,na.rm = TRUE)
CarSales[is.na(CarSales$Resalevalue),2]<-mean(CarSales$Resalevalue,na.rm = TRUE)


#Removing outliers
boxplot(CarSales$Resalevalue)
boxplot(CarSales$Priceinthousands)
boxplot(CarSales$Enginesize)
boxplot(CarSales$Horsepower)
boxplot(CarSales$Wheelbase)
#Preserve original data set

#Partitioning the data
install.packages("caret")
library(caret)
colnames(CarSales)
Train <- createDataPartition(CarSales$Salesinthousands,p=0.70,list = FALSE)
FinalTrain<-CarSales[Train,]
FinalTest<-CarSales[-Train,]

#Regression
Reg1<-lm(Salesinthousands~.,data = FinalTrain)
summary(Reg1)

#Residuals Analysis-Null hypothesis data is normal
fitted(Reg1)
resid<-Reg1$residuals
shapiro.test(resid)
#Correcting for non normality is not always necessary

#Checking for multicolinearity
colnames(CarSales)
Data1<-CarSales[,-3]
View(Data1)
cor(Data1)

#Checking for heteroscedasticity
bptest(Reg1)

#Checking for autocorrelation
dwt(Reg1)

#Predition on Test Data
Predict1<-predict(Reg1,FinalTest)

#Checking for MAPE
Predicttest<-cbind(FinalTest,Predict1)
View(Predicttest)
Predicttest$Error<- abs(((Predicttest$Salesinthousands - Predicttest$Predict1)
                   /(Predicttest$Salesinthousands))*100)
mean(Predicttest$Error,na.rm = TRUE)

##Corrective Measures
#Corelated resale value and price in thousands - drop resale value
#Drop Engine size - As engine size and horse power correlated
#Drop length - As length and wheelbase correlated

#New regression model
colnames(FinalTrain)
Reg2<-lm(Salesinthousands~.,data = FinalTrain[,-c(2,5,9)])
summary(Reg2)

#New prediction
predict2<-predict(Reg2,FinalTest[,-c(2,5,9)])

#Checking the MAPE
Predicttest2<-cbind(FinalTest,predict2)
View(Predicttest2)
Predicttest2$Error<- abs(((Predicttest2$Salesinthousands - Predicttest2$predict2)
                         /(Predicttest2$Salesinthousands))*100)
mean(Predicttest2$Error,na.rm = TRUE)
