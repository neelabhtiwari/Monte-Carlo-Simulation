ExpW2=0
ExpW5=0
path=10
val=5000
t=seq(from=0,to=5,by=5/val)
colour=rainbow(10)
for(i in 1:path){
  Z=rnorm((val+1),0,1)
  W=c(1:(val+1))
  W[1]=0
  for(j in 2:(val+1)){
    W[j]=W[j-1]+sqrt(t[j]-t[j-1])*Z[j]
    if(t[j]==2){
      ExpW2=ExpW2+W[j]
    }
    if(t[j]==5){
      ExpW5=ExpW5+W[j]
    }
  }
  if(i==1){
    plot(t,W,'l',xlab="Time (t)",ylab="W(t) : Sample Paths",ylim=c(min(W)-1,max(W)+1),col=colour[i])
  }
  else{
    lines(t,W,'l',xlab="Time (t)",ylab="W(t) : Sample Paths",ylim=c(min(W)-1,max(W)+1),col=colour[i])
  }
}
cat("Exp[W(2)] = ",ExpW2/10,"\nExp[W(5)] = ",ExpW5/10)