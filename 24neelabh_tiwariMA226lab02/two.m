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
st1
st2
st3
figure;
subplot(3,1,1);
scatter(st1(1:999,1),st1(2:1000,1));
title('For 1000 Values Generated');
subplot(3,1,2);
scatter(st2(1:9999,1),st2(2:10000,1));
title('For 10000 Values Generated');
subplot(3,1,3);
scatter(st3(1:99999,1),st3(2:100000,1));
title('For 100000 Values Generated');
figure;
subplot(3,1,1);
bar(st1);
title('For 1000 Values Generated');
subplot(3,1,2);
bar(st2);
title('For 10000 Values Generated');
subplot(3,1,3);
bar(st3);
title('For 100000 Values Generated');
figure;
scatter3(st3(1:99998),st3(2:99999),st3(3:100000));
title('Plotting triplet Ui,Ui+1 and Ui+2 in unit cube')






