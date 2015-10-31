distrb<-function(type, N=1000, n=100, m=0, sd=1, p=0.33, lam=3){
  # Returns a random sample based on the named distribution
  
  xbar=numeric(N)
  if (type=='uniform') {
    for (i in 1:N) {
      x=runif(n); 
      xbar[i]=mean(x);
    }
  }
  
  if (type=='normal') {
    for (i in 1:N) {
      x=rnorm(n, m, sd); 
      xbar[i]=mean(x);
    }
  }
  
  if (type=='binomial') {
    for (i in 1:N) {
      x=rbinom(N,n,p); 
      xbar[i]=mean(x);
    }
  }
  
  if (type=='poisson') {
    for (i in 1:N) {
      x=rpois(n,lam); 
      xbar[i]=mean(x);
    }
  }
  return(xbar)
}

readinteger <- function()
{ 
  n <- readline(prompt="Enter an sample size: ")
  return(as.integer(n))
}

readstring <- function()
{ 
  n <- readline(prompt="Enter an distribution (choose from uniform/normal/binomial/poisson): ")
  return(n)
}

# Get user inputs
n1 <- readinteger()
distribution <- readstring()

# Obatin samples
sample_mean=distrb(distribution, n=n1)

# Plot histograms, and an overlay plot.
hist(sample_mean, probability = TRUE, col='white', main=distribution)
lines(density(sample_mean, adjust=2), col="orange", lwd=4)
