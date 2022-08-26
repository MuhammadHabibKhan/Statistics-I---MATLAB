function [] = groupedrange(L,U)
x = U(:,1);
y = L(:,2);
if x==y
    ma = max(U);
    mi = min(L);
    Range = (ma-mi);
    fprintf('Range of the given data is:  %g\n',Range)
else
    U=U-0.5;
    l=L-0.5;
    if l >0
        ma = max(U);
        mi = min(l);
        Range = (ma-mi);
        fprintf('Range of the given data is:  %g\n',Range)
    else
        ma = max(U);
        mi = min(L);
        Range = (ma-mi);
        fprintf('Range of the given data is:  %g\n',Range)
    end
end
end

