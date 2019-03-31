ExpY2=0
ExpY5=0
path=10
val=5000
t=seq(from=0,to=5,by=5/val)
colour=rainbow(10)
for(i in 1:path){
  Z=rnorm((val+1),0,1)
  Y=c(1:(val+1))
  Y[1]=5
  for(j in 2:(val+1)){
    Y[j]=Y[j-1]+(0.0325-0.05*t[j-1])*(t[j]-t[j-1])+(0.012+0.0138*t[j-1]+0.00125*t[j-1]*t[j-1])*sqrt(t[j]-t[j-1])*Z[j]
    if(t[j]==2){
      ExpY2=ExpY2+Y[j]
    }
    if(t[j]==5){
      ExpY5=ExpY5+Y[j]
    }
  }
  if(i==1){
    plot(t,Y,'l',xlab="Time (t)",ylab="Y(t) : Sample Paths",ylim=c(min(Y),max(Y)),col=colour[i])
  }
  else{
    lines(t,Y,'l',xlab="Time (t)",ylab="Y(t) : Sample Paths",ylim=c(min(Y),max(Y)),col=colour[i])
  }
}
cat("Exp[Y(2)] = ",ExpY2/10,"\nExp[Y(5)] = ",ExpY5/10)