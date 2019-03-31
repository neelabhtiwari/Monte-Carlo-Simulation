clear
clc
for num=1:4
c=[2.109375,5,50,100];
j=100000;
u=rand(1,j)';
g=rand(1,j)';
k=1;
for i=1:j
   if u(i)<((20*g(i)*(1-g(i))^3)/c(num))
        y(k)=g(i);
        it(k)=i;
        k=k+1;
    end
end
y=y';
accepted_var=length(y)
for i=2:length(it)
      fit(i)=it(i)-it(i-1);
end
fit(1)=it(1);
avg_of_iterations=mean(fit)

X=0.00125:0.0025:0.9975;
Z=0:0.0025:1;
Y=-4*(Z.^5)+15*(Z.^4)-20*(Z.^3)+10*(Z.^2);
freq=histc(y,Z);
cfreq=zeros(401,1);
cfreq(1,1)=freq(1,1);
for i=2:401
    cfreq(i,1)=cfreq(i-1,1)+freq(i,1);
end
cfreq=cfreq/length(y);
figure;
plot(Z,Y,'-r');
hold on
plot(X,cfreq(1:399));
legend('Expected C.D.F','Generated C.D.F')
xlabel('Range (x)');
ylabel('P(X=x)');
clear
end
