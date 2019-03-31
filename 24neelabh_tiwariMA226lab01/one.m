clc
a=6;
b=0;
m=11;
x=zeros(11,11);
for x0=0:10
    x(x0+1,1)=x0;
    x(x0+1,2)=mod((a*x0)+b,m);
    for j=3:11
        x(x0+1,j)=mod((a*x(x0+1,j-1))+b,m);
    end
end
x
a=3;
b=0;
m=11;
y=zeros(11,11);
for x0=0:10
    y(x0+1,1)=x0;
    y(x0+1,2)=mod((a*x0)+b,m);
    for j=3:11
        y(x0+1,j)=mod((a*y(x0+1,j-1))+b,m);
    end
end
y

    
    