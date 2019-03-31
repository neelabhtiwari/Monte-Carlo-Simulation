clc
a=1597;
b=51749;
m=244944;
for x=5:9
    for i=1:m
        x=mod(a*x+b,m);
        u(i)=x/m;
    end
  frange=0:0.05:1;
  count=histc(u,frange);
  count'
  figure;
  bar(frange,count)
end
    