<<<<<<< HEAD
test_that("myncurve returns the correct structure", {
  res <- myncurve(mu = 10, sigma = 5, a = 6)

  expect_true(is.list(res))
  expect_true(all(c("mu", "sigma", "a", "prob") %in% names(res)))
})

test_that("myncurve returns correct numeric values", {
  res <- myncurve(mu = 10, sigma = 5, a = 6)

  # check that returned elements match inputs
  expect_equal(res$mu, 10)
  expect_equal(res$sigma, 5)
  expect_equal(res$a, 6)

  # check probability value matches pnorm()
  expected <- pnorm(6, mean = 10, sd = 5)
  expect_equal(res$prob, expected, tolerance = 1e-8)
})

test_that("myncurve handles edge cases correctly", {
  # a much larger bound (tail area)
  res <- myncurve(mu = 0, sigma = 1, a = 5)
  expect_true(res$prob > 0.99)
})
=======
test_that("myncurve returns the correct structure", {
  res <- myncurve(mu = 10, sigma = 5, a = 6)

  expect_true(is.list(res))
  expect_true(all(c("mu", "sigma", "a", "prob") %in% names(res)))
})

test_that("myncurve returns correct numeric values", {
  res <- myncurve(mu = 10, sigma = 5, a = 6)

  # check that returned elements match inputs
  expect_equal(res$mu, 10)
  expect_equal(res$sigma, 5)
  expect_equal(res$a, 6)

  # check probability value matches pnorm()
  expected <- pnorm(6, mean = 10, sd = 5)
  expect_equal(res$prob, expected, tolerance = 1e-8)
})

test_that("myncurve handles edge cases correctly", {
  # a much larger bound (tail area)
  res <- myncurve(mu = 0, sigma = 1, a = 5)
  expect_true(res$prob > 0.99)
})
>>>>>>> c117b2c483ce92ab91b90a02ac941e651a7ef973
