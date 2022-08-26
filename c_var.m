function [] = c_var(d)
n = length(d);
sum_f=sum(d);
mean=sum_f/n;
xmean=round(mean,2);
i=1:n;
x=d(:,i);
sd = sqrt(sum(((x-xmean).^2))/n); %for population only, if sample then /n-1
fprintf ('Coefficient Of Variation   (σ)   :  %.2f%%\n',((sd/mean)*100))
end


