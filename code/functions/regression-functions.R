residual_sum_squares <- function(lm_object){
  #Calculates the Residual Sum of Squares, the sum of the squared
  #  difference between an observation and its predicted value.
  #This function takes a regression object (made via lm()) and 
  #  outputs a double.
  return(sum((lm_object$residuals)^2))
}

total_sum_squares <- function(lm_object){
  #Calculates the Total Sum of Squares, the sum of the squared
  #  difference between an observation and its mean (only for a 
  #  response variable). 
  #The TSS is the amount of variability in the response variable.
  #This function takes in a regression object (made via lm()) and
  #  outputs a double.
  data_set <- lm_object$model
  return(sum((data_set[,1] - mean(data_set[,1]))^2))
}

r_squared <- function(lm_object){
  #Calculates the R^2 statistic, which is a number of absolute value
  #  between 0 and 1 that represents what percentage of the variability
  #  seen in the response variable is explained by a given linear model.
  #This function takes in a regression object (made via lm()) and 
  #  outputs a double with absolute value between 0 and 1.
  return(1 - residual_sum_squares(lm_object)/total_sum_squares(lm_object))
}

f_statistic <- function(lm_object){
  #This function calculates the F-statistic, which is a number
  #  that indicates how confidently we can say that there is an
  #  effect on the response variable due to the independent variable(s).
  #  Values much larger than 1 generally signify a stronger effect
  #  due to the independent variable(s).
  #This function takes in a regression object (made via lm()) and
  #  outputs a double.
  TSS <- total_sum_squares(lm_object)
  RSS <- residual_sum_squares(lm_object)
  p <- ncol(lm_object$model) - 1
  n <- nrow(lm_object$model)
  return(((TSS - RSS) / p) / (RSS / (n - p - 1)))
}

residual_std_error <- function(lm_object){
  #This function calculates the Residual Standard Error, which is the
  #  average amount that the response variable will differ from the
  #  true regression line - that is, it is a measure of the noise of
  #  a response variable.
  #This function takes in a regression object (made via lm()) and
  #  outputs a double.
  RSS <- residual_sum_squares(lm_object)
  p <- ncol(lm_object$model) - 1
  n <- nrow(lm_object$model)
  return(sqrt(RSS / (n - p - 1)))
}