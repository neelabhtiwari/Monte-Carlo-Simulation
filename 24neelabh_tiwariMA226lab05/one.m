clear
clc
val=[100,10000];

for num = 1:2
    ub1=rand(1,val(num));
    ub2=rand(1,val(num));
    
    %box
    tic;
    R=-2*log(ub1);
    V=2*pi*ub2;
    for i=1:val(num)
        Zb(i)=sqrt(R(i))*cos(V(i));
    end
    toc;
    if num==1
        mean_of_generated_RV_for_100_values=mean(Zb)
        variance_of_generated_RV_for_100_values=var(Zb)
    else 
        mean_of_generated_RV_for_10000_values=mean(Zb)
        variance_of_generated_RV_for_10000_values=var(Zb)
    end
    frange=min(Zb):0.05:max(Zb);
    count=histc(Zb,frange);
    figure;
    plot(frange,count,'Linewidth',3);
    title(['By Box-Mueller method for N(0,1) for ' num2str(val(num)) ' values ']);
    xlabel('Values Sampled');
    ylabel('Frequency')
    %boxtranslation
    
    Zfor05=Zb*sqrt(5)+0;
    frange=min(Zfor05):0.05:max(Zfor05);
    range=-20:0.05:20;
    rangemid=range/2;
    y=(1/(sqrt(2*pi)*sqrt(5)))*exp(-(rangemid.*rangemid)/(2*5));
    count=histc(Zfor05,frange);
    count=count/(0.05*val(num));
    figure;
    hold on;
    plot(frange,count);
    title(['Density function comparison of N(0,5) for ' num2str(val(num)) ' values by Box-Mueller']);
    plot(rangemid,y,'r','Linewidth',3);
    xlabel('Value of x');
    ylabel('Density');
    hold off;
    meanz05=mean(Zfor05);
    varz05=var(Zfor05);    
    
    Zfor55=Zb*sqrt(5)+5;
    frange=min(Zfor55):0.05:max(Zfor55);
    range=-20:0.05:30;
    rangemid=range/2;
    y=(1/(sqrt(2*pi)*sqrt(5)))*exp(-((rangemid-5).*(rangemid-5))/(2*5));
    count=histc(Zfor55,frange);
    count=count/(0.05*val(num));
    figure;
    hold on;
    plot(frange,count);
    title(['Density function comparison of N(5,5) for ' num2str(val(num)) ' values by Box-Mueller']);
    plot(rangemid,y,'r','Linewidth',3);
    xlabel('Value of x');
    ylabel('Density');
    hold off;
    meanz55=mean(Zfor55);
    varz55=var(Zfor55); 
    
    
    %marsaglia
    tic;
    k=0;
    for i=1:val(num)
        ub1(i)=2*ub1(i)-1;
        ub2(i)=2*ub2(i)-1;
        X=ub1(i)*ub1(i)+ub2(i)*ub2(i);
        if(X<=1)
            k=k+1;
            Y(i)=sqrt((-2*log(X)/X));
            Zm(k)=ub1(i)*Y(i);
        end
    end
    toc;
    if num==1
        mean_of_generated_RV_for_100_values=mean(Zm)
        variance_of_generated_RV_for_100_values=var(Zm)
        prop_of_values_rejected_for_100_values=1-k/val(num)
    else
        mean_of_generated_RV_for_10000_values=mean(Zm)
        variance_of_generated_RV_for_10000_values=var(Zm)
        prop_of_values_rejected_for_10000_values=1-k/val(num)
    end
    frange=min(Zm):0.05:max(Zm);
    count=histc(Zm,frange);
    figure;
    plot(frange,count,'Linewidth',3);
    title(['By Marsaglia Bray Method for N(0,1) ' num2str(val(num)) ' values ']);
    xlabel('Values Sampled');
    ylabel('Frequency')

%marsagliatranslation
    
    Zfor05=Zm*sqrt(5)+0;
    frange=min(Zfor05):0.05:max(Zfor05);
    range=-20:0.05:20;
    rangemid=range/2;
    y=(1/(sqrt(2*pi)*sqrt(5)))*exp(-(rangemid.*rangemid)/(2*5));
    count=histc(Zfor05,frange);
    count=count/(0.05*val(num));
    figure;
    hold on;
    plot(frange,count);
    title(['Density function comparison of N(0,5) for ' num2str(val(num)) ' values by Marsaglia Bray']);
    plot(rangemid,y,'r','Linewidth',3);
    xlabel('Value of x');
    ylabel('Density');
    hold off;
    meanz05=mean(Zfor05);
    varz05=var(Zfor05);
    
    Zfor55=Zm*sqrt(5)+5;
    frange=min(Zfor55):0.05:max(Zfor55);
    range=-20:0.05:30;
    rangemid=range/2;
    y=(1/(sqrt(2*pi)*sqrt(5)))*exp(-((rangemid-5).*(rangemid-5))/(2*5));
    count=histc(Zfor55,frange);
    count=count/(0.05*val(num));
    figure;
    hold on;
    plot(frange,count);
    title(['Density function comparison of N(5,5) for ' num2str(val(num)) ' values by Marsaglia Bray']);
    plot(rangemid,y,'r','Linewidth',3);
    xlabel('Value of x');
    ylabel('Density');
    hold off;
    meanz55=mean(Zfor55);
    varz55=var(Zfor55);
end

