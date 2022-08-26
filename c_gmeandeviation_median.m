function [] = c_gmeandeviation_median(L,U,F) %takes input lower and upper limit & frequency
cf = cumsum(F); %calculates cumulative frequency
n = length(F);
sum_f= sum(F); %summation of frequency 
r = sum_f/2; %summation of frequency divided by 2 which tells us the median group by looking in which value 
[j] = find(cf>=r,1);
f = F(j);
cfp = cf(j-1);
k=L(j); %lower class limit of the median group
x = U(:,1);
y = L(:,2);
if x == y %if else condition here for discrete and continuous intervals 
    l=k;
else
    l=k-0.5; %subtracting 0.5 from it as the formula has lower class boundary instead of class limit.
end
h1=(U-L); %to find width we subtract upper and lower limit 
h=h1(:,1); %but the above command prints the width in a row vector and we need only a singular value
if x == y %if else condition here for discrete and continuous intervals
    median=l+(h/f)*((sum_f/2)-cfp); %formula for grouped median
    xmedian=round(median,1);
else
    h=h+1; %we add 1 to the width as the computer calculates width one less because of subtraction.
median=l+(h/f)*((sum_f/2)-cfp); %formula for grouped median
xmedian=round(median,1);
end
i=1:n;
x=L(:,i);
y=U(:,i);
f1=F(:,i);
z=(x+y)/2;
MD = sum(f1.*(abs(z-xmedian)))/sum_f;
xMD=round(MD,2);
fprintf ('Coefficient of Grouped Mean Deviation about Median:  %.1f%%\n',((xMD/xmedian)*100))
end

