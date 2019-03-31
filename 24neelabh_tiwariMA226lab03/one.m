clear
clc
val=[10000000,10000,1000];
for num=1:3
u=rand(1,val(num));
c=[1,3,5,7,9];
q=0:0.2:1;
X=zeros(1,val(num));

for i=1:val(num)
    for k=1:5
        if (u(i)<=q(k+1) && u(i)>q(k)) 
            X(i)=c(k);
            break;
        end
    end
end
range=[1,3,5,7,9];
freq=histc(X,range)';
prob=freq/val(num);
frequency=freq
probability=prob
figure;
bar(c,freq);
end