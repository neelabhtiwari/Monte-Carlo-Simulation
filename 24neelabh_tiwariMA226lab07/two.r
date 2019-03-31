l=2
n=50
U=runif(n,min=0,max=1)
X=vector()
cdf=vector()
for(j in 1:n){
  i=0;p=exp(-l);f=p;
  while(U[j]>f){
    p=(l*p)/(i+1);
    f=p+f;
    i=i+1;
  }
  X[j]=i
  cdf[j]=f
}

#plotting PMF
plot(X,(l^X)*(exp(-l))/factorial(X),main="Actual PMF of generated values",sub="For 50 values generated",xlab="X - values",ylab="f(X) i.e. PMF",col="red")
plot(table(X)/n,main="Observed PMF of generated values",sub="For 50 values generated",xlab="X - values",ylab="f(X) i.e. PMF",'p',col="green")
plot(X,(l^X)*(exp(-l))/factorial(X),main="For 50 values generated",sub="Red = Actual, Green = Observed",xlab="X - values",ylab="f(X) i.e. PMF",col="red")
par(new=TRUE)
plot(table(X)/n,xlab="",ylab="",'p',col="green")

#plotting CDF
plot(X,cdf,main="Cumulative Distribution Function",sub="For 50 values generated",xlab="X - values",ylab="F(X) i.e. CDF")