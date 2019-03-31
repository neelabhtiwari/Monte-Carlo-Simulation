total=100000
a1_ans=c(1:total)
a2_ans=c(1:total)

base1=2
base2=3

for(i in 1:total){
  k=i
  j=1
  ans=as.double(0)
  while(k>0){
    r=k%%base1
    k=floor(k/base1)
    ans=ans+(r)*(1/(base1)^j)
    j=j+1 
  }
  a1_ans[i]=ans
  
  k=i
  j=1
  ans=as.double(0)
  while(k>0){
    r=k%%base2
    k=floor(k/base2)
    ans=ans+(r)*(1/(base2)^j)
    j=j+1 
  }
  a2_ans[i]=ans
}

for1_100=c(1:100)
for2_100=c(1:100)

for(i in 1:100){
  for1_100[i]=a1_ans[i]
  for2_100[i]=a2_ans[i]
}


plot(for1_100,for2_100,xlab=expression("φ"[2]),ylab=expression('φ'[3]),main="2-D Plot for 100 values")
plot(a1_ans,a2_ans,xlab=expression('φ'[2]),ylab=expression('φ'[3]),main="2-D Plot for 100000 values")



