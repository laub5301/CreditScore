#add caret and e1071 libraries
#import credit_data.csv from Files
#convert default column into a factor
credit_data$default10yr = as.factor(credit_data$default10yr)
#print out levels: two levels "0" or "1"
levels(credit_data$default10yr)

head(credit_data)

#change column names
colnames(credit_data) <- c("id", "income", "age", "loan", "LTI", "default")

#reference columns without $ operator
attach(credit_data)

#define a 10-fold cross validation
train_control <- trainControl(method = "cv", number=10)

#train logisitic regression model with 3 features (income, age, loan)
model <- train(default~income+age+loan, data=credit_data, trControl=train_control, method="glm", family="binomial")

#check beta parameters + p-values
summary(model)
#all three features are important for predicting default

#print out model to see accuracy of model
print(model)
#~95% accuracy using logisitic regression model