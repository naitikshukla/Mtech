library('DMwR')

data <- read.csv(file = "C:\\Users\\naitikshukla\\Downloads\\ws2b\\trialPromoResults.csv", header = TRUE, sep = ",")
data_4000 <- read.csv(file = "C:\\Users\\naitikshukla\\Downloads\\ws2b\\custdatabase.csv", header = TRUE, sep = ",")

#spliting training and testing(80%,20%)
set.seed(10)
indexed <- sample(1:nrow(data), size = 0.2*nrow(data))
trial_test <- data[indexed,]
trial_train1 <- data[-indexed,]

print(table(data$status))
print(prop.table(table(data$status)))

print(table(trial_train1$status))
print(prop.table(table(trial_train1$status)))

print(table(trial_test$status))
print(prop.table(table(trial_test$status)))

#SMOTE
balancedData <- SMOTE(status~., trial_train1, perc.over = 2300, k = 7, perc.under = 100, learner = NULL)
print(table(balancedData$status))
print(prop.table(table(balancedData$status)))

trial_train <- SMOTE(status~., balancedData, perc.over = 200, k = 15,perc.under = 200, learner = NULL )
print(table(trial_train$status))
print(prop.table(table(trial_train$status)))


#model building

##svm
library(e1071)
library(caret)
svm_model <- svm(status~., data = trial_train)
svm_result <- predict(object = model_svm, newdata = trial_test, type = 'class')
table(svm_result, trial_test$status)
confusionMatrix(svm_result, trial_test$status)

getwd()
setwd("C:\\Users\\naitikshukla\\Downloads\\ws2b")
save(svm_model, file = "svm_WS2b.rda")

##Naive Bayes
nb_model <- naiveBayes(x = subset(trial_train, select = status), y = trial_train$status)
result_nb <- predict(object = nb_model, newdata = trial_test, type='class')
table(result_nb, trial_test$status)
confusionMatrix(result_nb, trial_test$status)
###########Checking model performance with complete Dataset
result_nb1 <- predict(object = nb_model, newdata = data, type='class')
table(result_nb1, data$status)
confusionMatrix(result_nb1, data$status)
##########save the model
save(nb_model, file = "Naive_bayes_WS2b.rda")
###########Write the result in csv file
promo_prob<-data.frame(actual = data,result_nb1)
write.csv(promo_prob, file = "C://Users//naitikshukla//Downloads//ws2b//TrialPromo_AfterClass.csv", sep = ",",
          qmethod = "double")

#Predict result for Custdatabase.csv for 4000 records using Naive Bayes model.
result_nb_4000 <- predict(object = nb_model, newdata = data_4000, type='class')
confusionMatrix(result_nb_4000, data_4000$status)
promo_prob_4000<-data.frame(actual = data_4000,result_nb_4000)
write.csv(promo_prob_4000, file = "C://Users//naitikshukla//Downloads//ws2b//custdatabase_AfterClass.csv", sep = ",",
          qmethod = "double")
