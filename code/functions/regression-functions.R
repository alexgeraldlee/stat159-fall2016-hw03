residual_sum_squares <- function(lm_object){
  return(sum((lm_object$residuals)^2))
}

total_sum_squares <- function(lm_object){
  #this function only can take an lm() object for a single regression
  #since R cannot return multiple values (easily), we can only return one
  #TSS is the amount of variability in the response variable
  data_set <- lm_object$model
  return(sum((data_set[,1] - mean(data_set[,1]))^2))
}

r_squared <- function(lm_object){
  return(1 - residual_sum_squares(lm_object)/total_sum_squares(lm_object))
}

f_statistic <- function(lm_object){
  TSS <- total_sum_squares(lm_object)
  RSS <- residual_sum_squares(lm_object)
  p <- ncol(lm_object$model) - 1
  n <- nrow(lm_object$model)
  return(((TSS - RSS) / p) / (RSS / (n - p - 1)))
}

residual_std_error <- function(lm_object){
  RSS <- residual_sum_squares(lm_object)
  p <- ncol(lm_object$model) - 1
  n <- nrow(lm_object$model)
  return(sqrt(RSS / (n - p - 1)))
}