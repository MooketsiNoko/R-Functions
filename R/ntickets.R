#' Overbooking problem
#'
#' @param N number of seats in a flight
#' @param gamma probability a plane will truly be overbooked
#' @param p probablility of a "show"
#'
#' @returns two Objective function Vs n plots, one for discrete and one for the continuous case, and a list of values containing nd, nc, N, p and gammma.
#' @export
#'
<<<<<<< HEAD
#' @importFrom grDevices rainbow
#' @importFrom graphics abline barplot curve hist layout legend par polygon segments text
#' @importFrom stats dnorm dpois pbinom pnorm quantile rpois uniroot
#'
=======
>>>>>>> 88f302ec73812c4ee0704a0f1c335c148d57bf92
#' @examples ntickets(400,0.02,0.95)
ntickets <- function(N, gamma, p) {


  # Define the "objective functions" for each method
  f_discrete <- function(n) 1 - gamma - pbinom(N, n, p)
  f_normal   <- function(n) 1 - gamma - pnorm((N + 0.5 - n * p) / sqrt(n * p * (1 - p)))


  # Find n for the discrete (Binomial) case
  n_vals <- N:(N + 1000)
  probs <- pbinom(N, n_vals, p)
  nd <- max(n_vals[probs >= (1 - gamma)])


  # Find n for the Normal approximation case using uniroot()
  root <- tryCatch(
    uniroot(f_normal, interval = c(N, N + 1000))$root,
    error = function(e) NA
  )
  nc <- ifelse(is.na(root), NA, round(root, 3))

  x_min <- N
  x_max <- N + 30
  y_min <- 0
  y_max <- 1

  par(mfrow = c(2, 1), mar = c(4.5, 4.5, 3, 1))

  # 1. Discrete objective vs n
  # 2. Normal objective vs n

  n_seq <- seq(N, N + 30, by = 1)

  # Discrete
  obj_d <- sapply(n_seq, f_discrete)

  plot(n_seq, obj_d, type = "o", pch = 16, cex = 0.7, col = "black",
       ylim = c(y_min, y_max),
       xlim = c(x_min, x_max),
       main = paste0("Objective Vs n to find optimal tickets sold\n(",
                     nd, ") gamma=", gamma, " N=", N, " discrete"),
       xlab = "n",
       ylab = "Objective")
  abline(h = 0, col = "red", lwd = 2)
  abline(v = nd, col = "red", lwd = 2)


  # Normal
  obj_c <- sapply(n_seq, f_normal)
  plot(n_seq, obj_c, type = "l", lwd = 2,
       ylim = c(y_min, y_max),
       xlim = c(x_min, x_max),
       main = paste0("Objective Vs n to find optimal tickets sold\n(",
                     nc, ") gamma=", gamma, " N=", N, " continuous"),
       xlab = "n",
       ylab = "Objective")
  abline(h = 0, col = "black", lwd = 1)
  if (!is.na(nc)) abline(v = nc, col = "blue", lwd = 2)

  # Return a named list with results
  result <- list(
    nd = nd,
    nc = nc,
    N = N,
    p = p,
    gamma = gamma
  )

  print(result)
  return(result)
}

