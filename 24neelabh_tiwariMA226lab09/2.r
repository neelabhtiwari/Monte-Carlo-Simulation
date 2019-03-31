M=c(100,1000,10000,100000)
for(i in 1:4){
  U=runif(M[i])
  Y1=exp(sqrt(U))
  Y2=exp(sqrt(1-U))
  Y=(Y1+Y2)/2
  new_th=mean(Y)
  old_th=mean(Y1) 
  new_var=var(Y)
  old_var=var(Y1)
  val=1-0.05/2
  Sn=new_var^0.5
  lrange=new_th-(Sn*qnorm(val,0,1))/(sqrt(M[i]))
  rrange=new_th+(Sn*qnorm(val,0,1))/(sqrt(M[i]))
  cat("95% confidence interval for M = ", M[i] , " is (" , left , "," , right , "). \n")
  cat("Var(Y1) = ", old_var , " Var(Y) = " , new_var ," \n")
  cat("Variation reduction percentage from variance of (Y1)/2 is : " , (old_var/2 - new_var)*100/(old_var/2) , "\n")
  cat("Variation reduction percentage from variance of Y1 is : " , (old_var - new_var)*100/(old_var) , "\n \n")
  }
  
  