M=c(100,1000,10000,100000)
for(i in 1:4){
  U=runif(M[i])
  X=exp(sqrt(U))
  Y=U^0.5
  ymean=mean(y)
  yvariance=var(y)
  mean=mean(x)
  variance=var(x)
  val=1-0.05/2
  c=(-cov(x,y))/yvariance
  varianceofcontrolvariates=var(x+c*(y-ymean))
  meanofcontrolvariates=mean(x+c*(y-ymean))
  lrange=meanofcontrolvariates - (varianceofcontrolvariates^0.5) * (qnorm(val,0,1))/(sqrt(M[i]))
  rrange=meanofcontrolvariates + (varianceofcontrolvariates^0.5) * (qnorm(val,0,1))/(sqrt(M[i]))
  cat("The 95% confidence interval for M = " ,M[i]," is (",left, "," ,right, ") \n")
  cat("Original Variance = ", variance , " Reduced Variance = " , varianceofcontrolvariates ," \n")
  cat("Variance Reduction Percentage = ",(variance - varianceofcontrolvariates)*100 / (variance) ,"\n")
}