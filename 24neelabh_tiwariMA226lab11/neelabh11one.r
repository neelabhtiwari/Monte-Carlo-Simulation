val=5000
mu=c(0.6, 0.6,-0.04, -0.04)
sig=c(0.1,0.2,0.1,0.2)
paths=10
t=seq(from=0,to=5,by=5/val)
colour=rainbow(10)
for(k in 1:4){
  S5=c(1:paths)
  for(i in 1:paths){
    Z=rnorm((val+1),0,1)
    S=c(1:(val+1))
    S[1]=100
    for(j in 2:(val+1)){
      S[j]=S[j-1]*exp((mu[k]-sig[k]*sig[k]/2)*(t[j]-t[j-1])+sig[k]*sqrt(t[j]-t[j-1])*Z[j])
      if(t[j]==5){
        S5[i]=S[j]
      }
    }
    if(i==1){
      plot(t,S,'l',xlab="Time (t)",ylab="S(t) : Sample Paths of stock price",ylim=c(min(S)-1, max(S)+1),col=colour[i])
      title(main = list(paste(" For μ: ", mu[k], " & σ: ", sig[k]))) 
    }
    else{
      lines(t,S,'l',xlab="Time (t)",ylab="S(t) : Sample Paths of stock price",ylim=c(min(S)-1, max(S)+1),col=colour[i])
    }
  }
  cat("\nfor mu and sigma = ",mu[k]," and ",(sig[k]))
  cat("\nTheoretical Exp[S(5)] = ",S[1]*exp(mu[k]*5)," Theoretical Var[S(5)] = ",S[1]*S[1]*exp(2*mu[k]*5)*(exp(sig[k]*sig[k]*5)-1))
  cat("\nObserved Exp[S(5)] = ",mean(S5),"\nObserved Var[S(5)] = ",var(S5),"\n")
}