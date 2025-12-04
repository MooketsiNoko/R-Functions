#' Curve function
#'
#' @param mu mean
#' @param sigma standard deviation
#' @param a limit
#'
#' @returns a curve with the shaded area between the curve and x-axis along with the calculated area
#' @export
#'
<<<<<<< HEAD
#' @importFrom grDevices rainbow
#' @importFrom graphics abline barplot curve hist layout legend par polygon segments text
#' @importFrom stats dnorm dpois pbinom pnorm quantile rpois uniroot
#'
#' @examples myncurve(mu=10,sigma=5, a=6)
myncurve <- function(mu, sigma, a) {
  x <- NULL
=======
#' @examples myncurve(mu=10,sigma=5, a=6)
myncurve <- function(mu, sigma, a) {
>>>>>>> 88f302ec73812c4ee0704a0f1c335c148d57bf92
  stopifnot(is.finite(mu), is.finite(a), is.finite(sigma), sigma > 0)

  # Plot window: ±3 standard deviations around the mean
  xl <- mu - 3 * sigma
  xr <- mu + 3 * sigma

  # Draw the Normal density
  curve(dnorm(x, mean = mu, sd = sigma),
        xlim = c(xl, xr), lwd = 2,
        xlab = "x", ylab = "Density",
        main = paste0("N(", mu, ", ", sigma, "):  P(X \u2264 ", a, ")"))

  # Shade from left edge to a
  shade_right <- max(xl, min(a, xr))
  if (shade_right > xl) {
    xcurve <- seq(xl, shade_right, length.out = 800)
    ycurve <- dnorm(xcurve, mean = mu, sd = sigma)
    polygon(c(xl, xcurve, shade_right), c(0, ycurve, 0), col = "violet")
  }

  # Probability and display
  p <- pnorm(a, mean = mu, sd = sigma)
  legend("topright", bty = "n",
         legend = paste0("P(X \u2264 ", a, ") = ", formatC(p, format = "f", digits = 4)))

  # Return the named list
  list(mu = mu, sigma = sigma, a = a, prob = p)
}
