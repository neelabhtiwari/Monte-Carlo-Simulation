clear
clc
for yo=1:4
c=[1.2,2,5,10];
j=100000;
u=rand(1,j);
a=rand(1,j);
fval=[0.11,0.12,0.09,0.08,0.12,0.10,0.09,0.09,0.10,0.10];
c1=[1,2,3,4,5,6,7,8,9,10];
q=[0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
k=1;
for i=1:j
    for v=1:10
        if(q(v)<u(i) & u(i)<=q(v+1))
            X(k)=c1(v);
            k=k+1;
            break;
        end
    end
end
k=1;
for i=1:j
   if a(i)<=(fval(X(i))/(c(yo)*0.1))
        y(k)=X(i);
        k=k+1;
    end
end
y=y';
y;
accepted_var=length(y)
fr=[1,2,3,4,5,6,7,8,9,10];
prob=histc(y,fr);
prob=prob/length(y);
prob
clear
end




