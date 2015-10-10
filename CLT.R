distrb<-function(type, N=10000, n=100, m=0, sd=1, p=0.33, lam=3){
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
      xbar[i]=mean;
    }
  }
  return(xbar)
}

sample_mean=distrb('normal', N=10000, n=100)
hist(sample_mean, probability = TRUE, col='blue', main='Normal')

