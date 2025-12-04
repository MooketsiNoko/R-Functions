#' Binary Bar plot Simulator
#'
#' @param iter number of iterations
#' @param n number of trials
#' @param p probability
#'
#' @returns Bar plot
#' @export
#'
<<<<<<< HEAD
#' @importFrom grDevices rainbow
#' @importFrom graphics abline barplot curve hist layout legend par polygon segments text
#' @importFrom stats dnorm dpois pbinom pnorm quantile rpois uniroot
#'
=======
>>>>>>> 88f302ec73812c4ee0704a0f1c335c148d57bf92
#' @examples mybinplot(100,10,0.7)

mybinplot = function(iter=100,n=10, p=0.5){

  #make a matrix filled with values of NA
  sam.mat = matrix(NA,nrow=n,ncol=iter, byrow=TRUE)

  #Make a vector to hold the number of successes in each trial
  succ=c()

  for(i in 1:iter){

    #Fill each column with a new sample
    sam.mat[,i] = sample(c(1,0),n,replace=TRUE, prob = c(p,1-p))

    #Calculate the sum from the sample
    succ[i] = sum(sam.mat[,i])
  }

  #Make a table of successes
  succ.tab = table(factor(succ,levels=0:n))

  #Make a barplot of the proportions
  barplot(succ.tab/(iter), col = rainbow(n+1), main="Binomial simulation", xlab="Number of successes")
  succ.tab/iter
}
