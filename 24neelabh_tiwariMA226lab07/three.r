n=50
b1=2
t1=1
b2=1.5
t2=1
p=0.4

#generating from x1
U1=runif(n,min=0,max=1)
X1=vector()
for(i in 1:n){
  X1[i]=(1/t1)*(-log(U1[i],base=exp(1)))^(1/b1)
}

#generating from x2
U2=runif(n,min=0,max=1)
X2=vector()
for(i in 1:n){
  X2[i]=(1/t2)*(-log(U2[i],base=exp(1)))^(1/b2)
}

#final generation
U=runif(n,min=0,max=1)
X=vector()
for(i in 1:n){
  if(U[i]<p)  X[i]=X1[i]
  else  X[i]=X2[i]
}

hist(X)