function [] = meandeviation_mean(d)
n = length(d);
sum_f=sum(d);
mean=sum_f/n;
i=1:n;
x=d(:,i);
MD = sum(abs(x-mean))/n;
fprintf ('Mean Deviation about Mean:  %.2f\n',MD)

end

