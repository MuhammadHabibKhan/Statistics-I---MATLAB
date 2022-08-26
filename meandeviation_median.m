function [] = meandeviation_median(d)
d = sort(d);
n = length(d);
r = rem(n,2);  
if r >0
    medianx = (n+1)/2;
    median = d(medianx);
else
    medianx = (n+1)/2;
    y = floor(medianx);
    j = d(:,y);
    j2=d(y+1);
    median = (j+j2)/2; 
end
i=1:n;
x=d(:,i);
MD = sum(abs(x-median))/n;
fprintf ('Mean Deviation about Median:  %.2f\n',MD)

end


