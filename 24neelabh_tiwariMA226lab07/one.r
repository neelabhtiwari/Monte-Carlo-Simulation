n=5000
U=runif(n,min=0,max=1)
X=vector()
#p=runif(1,min=0,max=1)
p=0.10
q=1-p
cat("p = ",p," q = ",q)
for(i in 1:n){
  X[i]=floor(log(U[i])/log(q))+1
}
plot(X,p*q^(X-1),main="Actual PMF of generated values",sub="For 50 values generated",xlab="X - values",ylab="f(X) i.e. PMF",col="red")
plot(table(X)/n,main="Observed PMF of generated values",sub="For 50 values generated",xlab="X - values",ylab="f(X) i.e. PMF",'p',col="green")
plot(X,p*q^(X-1),main="PMF of generated values",sub="For 50 values generated - Red = Actual, Green = Observed",xlab="X - values",ylab="f(X) i.e. PMF",col="red")
par(new=TRUE)
plot(table(X)/n,xlab="",ylab="",'p',col="green")
