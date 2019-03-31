clear
clc
j=100000;
al1=[2,1.5,2,1,3];
al2=[2.3,1.5,4,10,5];
for num=1:5
B=(gamma(al1(num))*gamma(al2(num)))/(gamma(al1(num)+al2(num)));
xmax(num)=(al1(num)-1)/(al1(num)+al2(num)-2);
f(num)=(1/B)*(xmax(num)^(al1(num)-1))*((1-xmax(num)^(al2(num)-1)));
u1=rand(1,j)';
u2=rand(1,j)';
k=1;
for i=1:j
     if (f(num)*u2(i))<=((1/B)*(u1(i)^(al1(num)-1))*((1-u1(i))^(al2(num)-1)))
         y(k)=u1(i);
         k=k+1;
     end
end
figure;
histogram(y);
length(y);
title(['For {\alpha}1 =' num2str(al1(num)) ' For {\alpha}2 =' num2str(al2(num))''])
xlabel('Value of random Variable')
ylabel('Frequency')
end
xmax;
f;