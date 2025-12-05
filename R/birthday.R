#' Birthday Function
#'
#' @param x number of people in sample
#'
#' @returns probability of two or more people with a common birthday
#' @export
#'
#' @examples birthday(20:24)
birthday <- function(x) {

  1 - exp(lchoose(365,x)+ lfactorial(x) - x*log(365))
}
