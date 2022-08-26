function [] = c_gmeandeviation_mean(L,U,F) %L,U,F are lower & upper limit and frequency respectively
x = (L+U)/2; %midpoint of class interval
n= length(F);
fx= F.*x; 
sum_f=sum(F);
sum_fx=sum(fx);
mean=sum_fx/sum_f; 
xmean=round(mean,1);
i=1:n;
f1=F(:,i);
MD = sum(f1.*(abs(x-xmean)))/sum_f;
xMD=round(MD,2);
fprintf ('Coefficient of Grouped Mean Deviation about Mean:  %.1f%%\n',((xMD/xmean)*100))

end

