function [] = percentile(d)
d = sort(d); %sorts in ascending order
n = length(d); %no. of values
for i = 1:100 %1 to 99 percentiles will be printed
    k = i/100; %the value 
    if k~=1/(n+1) %condition for inclusive
        p = ((i*(n-1))/100)+1; %formula for inclusive
        Z = floor(p);
        l = p-Z;
        if l == 0 %checks if the calculation is floating or not
            [j] = d(:,p);
            fprintf ('p%g\t', i) , fprintf ('%.2f\n',j) %prints if non floating      
            i = i + 1;
        else
            Y = floor(p); %starting of condition for floating and rounds it down
            if Y==0 %if it rounds down to zero then a bit different formula bc matlab can't index 0 
                fract=p;
                Percentilex1=(fract)*(d(1));
                Percentilex=Percentilex1+(d(:,1));
                Percentile = Percentilex+p;
                fprintf ('p%g\t', i) , fprintf ('%.2f\n',Percentile)
            else %if non zero then this code will be executed (method of interpolation)
                fract = p-Y; %fraction part will be calculated by subtracting original and rounded down value 
                j = d(:,Y); %rounded down pth value
                j2 = d(:,Y+1); %rounded up pth value
                qx1 = (fract)*(abs(j2-j)); %ubtract them and xply by the fraction we got earlier
                qx=qx1+j; %add this to the rounded down pth value which gives an average b/w rounded up and down value
                fprintf ('p%g\t', i) , fprintf ('%.2f\n',qx) %prints the interpolated value
            end
        end
    else
        p = i*(n+1)/100; %formula for exclusive if the value of k's values outside the range of 1/(n+1) in 0 to 1
        r = rem(k,(1/(n+1))); %remainder function to check if k is a multiple of 1/(n+1)
        if r==0 %if multiple then no interpolation needed
            [j] = d(:,p);
            fprintf ('p%g\t', i) , fprintf ('%.2f\n',j) %value is printed       
            i = i + 1;
        else
            Y = floor(p); %if k is not a multiple then we interpolate same as perviously 
            fract = p-Y;
            j = d(:,Y);
            j2 = d(:,Y+1);
            qx1 = (fract)*(abs(j2-j));
            qx=qx1+j;
            fprintf ('p%g\t', i) , fprintf ('%.2f\n',qx) 
        end
    end
end
end

