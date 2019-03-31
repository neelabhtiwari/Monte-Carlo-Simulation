M=c(100,1000,10000,100000)
for(i in 1:4){
  X=runif(M[i])
  Y=exp(sqrt(X))
  th=mean(Y)
  variance=var(X)
  Sn=variance^0.5
  val=1-0.05/2
  lrange=th-(Sn*qnorm(val,0,1))/(sqrt(M[i]))
  rrange=th+(Sn*qnorm(val,0,1))/(sqrt(M[i]))
  cat("The 95% confidence interval for M = " ,M[i]," is (",left, "," ,right, ") \n")
  cat("The estimated mean of I is ",th," \n")
  }
