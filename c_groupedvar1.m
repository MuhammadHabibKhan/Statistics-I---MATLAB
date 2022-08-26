function [] = c_groupedvar1(x,F) %L,U,F are lower & upper limit and frequency 
n= length(F);
fx= F.*x; 
sum_f=sum(F);
sum_fx=sum(fx);
mean=sum_fx/sum_f;
xmean=round(mean,2);
i=1:n;
a=x(:,i);
f1=F(:,i);
sd = sqrt(sum(f1.*((a-xmean).^2))/sum_f);
xsd = round(sd,2);
fprintf ('Coefficient of Variation For Grouped Data   :  %.2f%%\n',((xsd/xmean)*100))
end

