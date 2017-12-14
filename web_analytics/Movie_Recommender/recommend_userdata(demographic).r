library(arules)
library(arulesViz)
setwd("C:/Users/naitikshukla/Downloads/fin")

#Loading test and train data into memory
train = read.transactions('movielikes_userdata_train.txt', 'single', cols = c('UserID', 'movie'))
test = read.transactions('movielikes_userdata_test.txt', 'single', cols = c('UserID', 'movie'))

#convert to list for slicing operations
test.list = as(test, 'list')
str(test.list)
test.count = length(test) #individual users in test

# summary and visualisation of training transactions
summary(train)
itemFrequencyPlot(train, 'absolute', topN = 20)

#Find association rules using Apriori
rules <- apriori(train, list(supp = 0.20, conf = 0.80, minlen = 2))
rules.lhs = lhs(rules)
rules.rhs = rhs(rules)
rules.lhs.list = as(rules.lhs, 'list')
rules.rhs.list = as(rules.rhs, 'list')
#rules.lhs.movie = as(sapply(rules.lhs.list, function(x) x[grepl(re.movie, x)]), 'itemMatrix')

# filter for movie only consequent
re.movie = '^m[0-9]+$'
is.rhs.movie = grepl(re.movie, rules.rhs.list)

print('Top 10 rules by lift:')
inspect(head(sort(rules, by = "lift"), 10))

correct = 0
total = 0
for (i in 1:test.count) { # for each transaction (user)
  # find rules with antecedent (LHS) in transaction
  # also include multi antecedent rules
  is.lhs.in.tx <- is.subset(rules.lhs, test[i])
  
  # filter movies from consequent (RHS) of rules and union
  predictions = Reduce(union, as(rules.rhs[as.logical(is.lhs.in.tx) & as.logical(is.rhs.movie)], 'list'), vector('character'))
  
  # increment correct and total predictions
  correct = correct + sum(predictions %in% test.list[[i]])
  total = total + length(predictions)
}

inspect(test[1])
precision = correct / total

cat('No. of checked users: ', test.count, '\n')
cat('Correct predictions: ', correct, '\n')
cat('Total predictions: ', total, '\n')
cat('Precision: ', precision, '\n')


