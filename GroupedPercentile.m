function [] = GroupedPercentile(L,U,F) %takes input lower and upper limit & frequency
cf = cumsum(F); %calculates cumulative frequency
sum_f= sum(F); %summation of frequency 
for i=1:100
    r = i*sum_f/100; %summation of frequency divided by 2 which tells us the percentile group by looking in which value 
    [j] = find(cf>=r,1);
    f = F(j);
    if j==1
        cfp = 0;
    else
        cfp = cf(j-1);
    end
    k=L(j); %lower class limit of the percentile group
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
        groupedpercentile=l+(h/f)*((i*sum_f/100)-cfp); %formula for grouped percentile
        fprintf ('P%g\t', i) , fprintf ('%.2f\n',groupedpercentile)
        i = i+1;
    else
        h=h+1; %we add 1 to the width as the computer calculates width one less because of subtraction.
        groupedpercentile=l+(h/f)*((i*sum_f/100)-cfp); %formula for grouped percentile
        fprintf ('P%g\t', i) , fprintf ('%.2f\n',groupedpercentile)
        i = i+1;
    end
end
end



