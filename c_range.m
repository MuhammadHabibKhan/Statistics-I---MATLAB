function [] = c_range(d)
ma = max(d);
mi = min(d);
Range = (ma-mi)/(ma+mi);
fprintf('Coefficient of Range of the given data is:  %.2f%%\n',Range*100)
end


