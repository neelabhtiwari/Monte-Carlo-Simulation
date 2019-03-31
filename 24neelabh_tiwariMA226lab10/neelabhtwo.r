ExpX2=0
ExpX5=0
path=10
val=5000
mu=0.06
sig=0.3
t=seq(from=0,to=5,by=5/val)
colour=rainbow(10)
for(i in 1:path){
  Z=rnorm((val+1),0,1)
  X=c(1:(val+1))
  X[1]=5
  for(j in 2:(val+1)){
    X[j]=X[j-1]+mu*(t[j]-t[j-1])+sig*sqrt(t[j]-t[j-1])*Z[j]
    if(t[j]==2){
      ExpX2=ExpX2+X[j]
    }
    if(t[j]==5){
      ExpX5=ExpX5+X[j]
    }
  }
  if(i==1){
    plot(t,X,'l',xlab="Time (t)",ylab="X(t) : Sample Paths",ylim=c(min(X)-0.3,max(X)+0.3),col=colour[i])
  }
  else{
    lines(t,X,'l',xlab="Time (t)",ylab="X(t) : Sample Paths",ylim=c(min(X)-0.3,max(X)+0.3),col=colour[i])
  }
}
cat("Exp[X(2)] = ",ExpX2/10,"\nExp[X(5)] = ",ExpX5/10)