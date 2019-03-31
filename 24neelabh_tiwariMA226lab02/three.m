clc
a=34;
b=0;
m=345;
st1=zeros(1000,1);
st2=zeros(10000,1);
st3=zeros(100000,1);
st1(1,1)=3;
st2(1,1)=5;
st3(1,1)=5;
for i=2:17
    st1(i,1)=mod(a*st1(i-1)+b,m);
    st2(i,1)=mod(a*st2(i-1)+b,m);
    st3(i,1)=mod(a*st3(i-1)+b,m);
end
st1=st1/m;
st2=st2/m;
st3=st3/m;
for i=18:1000
    st1(i,1)=st1(i-17,1)-st1(i-5,1);
    if st1(i,1)<0   
        st1(i,1)=st1(i,1)+1;
    end
end
for i=18:10000
    st2(i,1)=st2(i-17,1)-st2(i-5,1);
    if st2(i,1)<0   
        st2(i,1)=st2(i,1)+1;
    end
end
for i=18:100000
    st3(i,1)=st3(i-17,1)-st3(i-5,1);
    if st3(i,1)<0   
        st3(i,1)=st3(i,1)+1;
    end
end
th=pi;
g1=zeros(1000,1);
g2=zeros(10000,1);
g3=zeros(100000,1);
g1=-th*log(1-st1);
g2=-th*log(1-st2);
g3=-th*log(1-st3);
frange=0:0.1:40;
count1=histc(g1,frange);
ans1=zeros(401,1);
ans1(1,1)=count1(1,1);
for i=2:401
    ans1(i,1)=ans1(i-1,1)+count1(i,1);
end
count2=histc(g2,frange);
ans2=zeros(401,1);
ans2(1,1)=count2(1,1);
for i=2:401
    ans2(i,1)=ans2(i-1,1)+count2(i,1);
end
count3=histc(g3,frange);
ans3=zeros(401,1);
ans3(1,1)=count3(1,1);
for i=2:401
    ans3(i,1)=ans3(i-1,1)+count3(i,1);
end
ans1=ans1/1000
ans2=ans2/10000
ans3=ans3/100000
x=0.05:0.1:39.5;
z=0:0.1:40;
y=1-exp(-z/th);
figure;
plot(z,y,'-r');
title('For 1000 values')
hold on
plot(x,ans1(1:395));
legend('Original Function','Generated CDF')
xlabel('Range (x)');
ylabel('P(X<=x)');
figure;
plot(z,y,'-r');
title('For 10000 values')
hold on
plot(x,ans2(1:395));
legend('Original Function','Generated CDF')
xlabel('Range (x)');
ylabel('P(X<=x)');
figure;
plot(z,y,'-r');
title('For 100000 values')
hold on
plot(x,ans3(1:395));
legend('Original Function','Generated CDF')
xlabel('Range (x)');
ylabel('P(X<=x)');
mean1000=mean(g1)
mean10000=mean(g2)
mean100000=mean(g3)
variance1000=var(g1)
variance10000=var(g2)
variance100000=var(g3)
