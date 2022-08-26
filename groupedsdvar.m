function [] = groupedsdvar(L,U,F) %L,U,F are lower & upper limit and frequency 
unit=input('Enter unit: ','s');
u = unit;
x = (L+U)/2; %midpoint of class interval
n= length(F);
fx= F.*x; 
sum_f=sum(F);
sum_fx=sum(fx);
mean=sum_fx/sum_f; 
i=1:n;
x=L(:,i);
y=U(:,i);
f1=F(:,i);
z=(x+y)/2;
var = sum(f1.*((z-mean).^2))/sum_f;
fprintf ('Grouped Variance            (σ^2) :  %.2f',var),fprintf(' %s\n',u)
sd = sqrt(sum(f1.*((z-mean).^2))/sum_f);
fprintf ('Grouped Standard Deviation  (σ)   :  %.2f',sd), fprintf(' %s\n',u)
end

