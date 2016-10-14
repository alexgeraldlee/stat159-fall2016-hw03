

mtcars_reg <- lm(mpg ~ disp + hp, data = mtcars)

advertising <- read.csv('../data/Advertising.csv')
ad_reg <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)


source('functions/regression-functions.R')

context("Ensuring Residual Sum of Squares function works as intended.")

test_that("RSS is correct for mtcars", {
  mtcars_rss <- residual_sum_squares(mtcars_reg)
  expect_equal(round(mtcars_rss, 4), 283.4934)
  expect_type(mtcars_rss, 'double')
  expect_length(mtcars_rss, 1)
})

test_that("RSS is correct for Advertising", {
  ad_reg_rss <- residual_sum_squares(ad_reg)
  expect_type(ad_reg_rss, 'double')
  expect_equal(round(ad_reg_rss, 3), 1.686)
  expect_length(ad_reg_rss, 1)
})

context("Ensuring Total Sum of Squares function works as intended.")

test_that("TSS is correct for mtcars", {
  mtcars_tss <- total_sum_squares(mtcars_reg)
  expect_equal(round(mtcars_tss, 3), 1126.047)
  expect_type(mtcars_tss, 'double')
  expect_length(mtcars_tss, 1)
})

test_that("TSS is correct for Advertising", {
  ad_reg_tss <- total_sum_squares(ad_reg)
  expect_type(ad_reg_tss, 'double')
  expect_equal(round(ad_reg_tss, 3), 5417.149)
  expect_length(ad_reg_tss, 1)
})

context("Ensuring R^2 function works as intended.")

test_that("R^2 is correct for mtcars", {
  mtcars_r2 <- r_squared(mtcars_reg)
  expect_equal(round(mtcars_r2, 4), .7482)
  expect_type(mtcars_r2, 'double')
  expect_length(mtcars_r2, 1)
  expect_lte(abs(mtcars_r2), 1)
})

test_that("R^2 is correct for Advertising", {
  ad_reg_r2 <- r_squared(ad_reg)
  expect_type(ad_reg_r2, 'double')
  expect_equal(round(ad_reg_r2, 4), .8972)
  expect_length(ad_reg_r2, 1)
  expect_lte(abs(ad_reg_r2), 1)
})

context("Ensuring F-statistic function works as intended.")

test_that("F-statistic is correct for mtcars", {
  mtcars_f <- f_statistic(mtcars_reg)
  expect_equal(round(mtcars_f, 4), 43.0946)
  expect_type(mtcars_f, 'double')
  expect_length(mtcars_f, 1)
})

test_that("F-statistic is correct for Advertising", {
  ad_reg_f <- f_statistic(ad_reg)
  expect_type(ad_reg_f, 'double')
  expect_equal(round(ad_reg_f, 1), 570.3)
  expect_length(ad_reg_f, 1)
})

context("Ensuring Residual Standard Error function works as intended.")

test_that("RSE is correct for mtcars", {
  mtcars_rse <- residual_std_error(mtcars_reg)
  expect_equal(round(mtcars_rse, 4), 3.1266)
  expect_type(mtcars_rse, 'double')
  expect_length(mtcars_rse, 1)
})

test_that("RSE is correct for Advertising", {
  ad_reg_rse <- residual_std_error(ad_reg)
  expect_type(ad_reg_rse, 'double')
  expect_equal(round(ad_reg_rse, 3), 1.686)
  expect_length(ad_reg_rse, 1)
})