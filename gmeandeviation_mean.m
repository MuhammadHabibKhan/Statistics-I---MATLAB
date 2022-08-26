function [] = gmeandeviation_mean(L,U,F) %L,U,F are lower & upper limit and frequency respectively
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
MD = sum(f1.*(abs(z-mean)))/sum_f;
fprintf ('Grouped Mean Deviation about Mean (x̅ ) :  %.2f\n',MD)

end

