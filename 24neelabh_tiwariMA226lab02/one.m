clc
u1(1)=0.5756;
u1(2)=0.4534;
for i=3:100000;
    u1(i)=mod((u1(i-1)+u1(i-2)),1);
end
figure;
scatter3(u1(1:99998),u1(2:99999),u1(3:100000))
title('For 100000 values generated')
u1'
u2(1)=0.5756;
u2(2)=0.4534;
for i=3:10000;
    u2(i)=mod((u2(i-1)+u2(i-2)),1);
end
figure;
scatter3(u2(1:9998),u2(2:9999),u2(3:10000))
title('For 10000 values generated')
u2'
u3(1)=0.5756;
u3(2)=0.4534;
for i=3:1000;
    u3(i)=mod((u3(i-1)+u3(i-2)),1);
end
figure;
scatter3(u3(1:998),u3(2:999),u3(3:1000))
title('For 1000 values generated')
u3'