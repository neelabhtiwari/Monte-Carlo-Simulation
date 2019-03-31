total=100000
a_ans=c(1:total)
base=2

for(i in 1:total){
  k=i
  j=1
  ans=as.double(0)
  while(k>0){
    r=k%%base
    k=floor(k/base)
    ans=ans+(r)*(1/(base)^j)
    j=j+1 
  }
  a_ans[i]=ans
}

for25=c(1:25)
for100=c(1:100)
for1000=c(1:1000)
for100000=c(1:100000)

for(i in 1:25){
  for25[i]=a_ans[i]
}
for(i in 1:100){
  for100[i]=a_ans[i]
}
for(i in 1:1000){
  for1000[i]=a_ans[i]
}
for(i in 1:100000){
  for100000[i]=a_ans[i]
}

print(for25)

ploti=c(1:999)
ploti1=c(1:999)
for(i in 1:999){
  ploti[i]=a_ans[i]
  ploti1[i]=a_ans[i+1]
}


lcg100=c(1:100)
lcg100000=c(1:100)
a=1597
b=51749
m=244944
x=1
for(i in 1:100){
  x=(a*x+b)%%m
  lcg100[i]=x/m
}
x=1
for(i in 1:100000){
  x=(a*x+b)%%m
  lcg100000[i]=x/m
}

plot(ploti,ploti1,xlab=expression('X'[i]),ylab=expression('X'[i+1]))


attach(mtcars)
par(mfrow=c(1,2)) 
hist(for100,xlab="Van Der Corput Sequence values",main="Histogram for Sampled Distributions for 100 values by\n numeric method",col='red')
hist(lcg100,xlab="LCG Values",main="Histogram for Sampled Distributions for 100 values by LCG")
detach()

attach(mtcars)
par(mfrow=c(1,2)) 
hist(for100000,xlab="Van Der Corput Sequence values",main="Histogram for Sampled Distributions for 100000 values\n by numeric method",col='red')
hist(lcg100000,xlab="LCG Values",main="Histogram Sampled Distributions for 100000 values by LCG")
detach()

attach(mtcars)
par(mfrow=c(1,2)) 
plot.ecdf(for100,xlab="Van Der Corput Sequence values",main="CDF for Sampled Distributions for 100 values\n by numeric method",col='red')
plot.ecdf(lcg100,xlab="LCG Values",main="CDF for Sampled Distributions for 100 values by LCG")
detach()

attach(mtcars)
par(mfrow=c(1,2)) 
plot.ecdf(for100000,xlab="Van Der Corput Sequence values",main="CDF for Sampled Distributions for 100000 values\n by numeric method",col='red')
plot.ecdf(lcg100000,xlab="LCG Values",main="CDF for Sampled Distributions for 100000 values by LCG")
detach()
