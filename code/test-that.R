

mtcars_reg <- lm(mpg ~ disp + hp, data = mtcars)

advertising <- read.csv('../data/Advertising.csv')
ad_reg <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)


source('functions/regression-functions.R')

context("Ensuring Residual Sum of Squares works as intended.")

test_that("RSS is correct", {
  expect_equal(residual_sum_squares(mtcars_reg), 283.4934)
  expect_equal(residual_sum_squares(ad_reg), )
})