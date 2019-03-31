clc
a=1229;
b=1;
m=2048;
x=5464;
for i=1:m
    x=mod(a*x+b,m);
    u(i)=x/m;
end
figure;
scatter(u(1:m-1),u(2:m))
