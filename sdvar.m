function [] = sdvar(d)
n = length(d);
sum_f=sum(d);
mean=sum_f/n;
i=1:n;
x=d(:,i);
var = sum(((x-mean).^2))/n; %for population only, if sample then /n-1
fprintf ('Variance            (σ^2) :  %.2f\n',var)
sd = sqrt(sum(((x-mean).^2))/n); %for population only, if sample then /n-1
fprintf ('Standard Deviation   (σ)   :  %.2f\n',sd)
end
