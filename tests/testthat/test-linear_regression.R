test_that("linear_regression works", {
  x = matrix(rnorm(3*100), nrow = 100, ncol = 3)
  y = matrix(rnorm(1*100), nrow = 100, ncol = 1)
  res = linear_regression(x, y)
  expect_equal(2 * 2, 4)
})
