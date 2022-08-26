function [] = decile(d)
d = sort(d); %sorts in ascending order
n = length(d); %no. of values
for i = 1:100 %1 to 99 percentiles will be printed
    k = i/100; %the value 
    if k~=1/(n+1) %condition for inclusive
        de = ((i*(n-1))/100)+1; %formula for inclusive
        Z = floor(de);
        l = de-Z;
        if l == 0 %checks if the calculation is floating or not
            [j] = d(:,de);
            rm = rem(i,10);
            if rm ==0
                fprintf ('D%g\t', i/10) , fprintf ('%.2f\n',j) %prints if non floating 
            else
            i = i + 1;
            end
        else
            Y = floor(de); %starting of condition for floating and rounds it down
            if Y==0 %if it rounds down to zero then a bit different formula bc matlab can't index 0 
                fract=de;
                Decilex1=(fract)*(d(1));
                Decilex=Decilex1+(d(:,1));
                Decile = Decilex+de;
                rm = rem(i,10);
                if rm ==0
                    fprintf ('D%g\t', i/10) , fprintf ('%.2f\n',Decile)
                end
            else %if non zero then this code will be executed (method of interpolation)
                fract = de-Y; %fraction part will be calculated by subtracting original and rounded down value 
                j = d(:,Y); %rounded down pth value
                j2 = d(:,Y+1); %rounded up pth value
                dx1 = (fract)*(abs(j2-j)); %ubtract them and xply by the fraction we got earlier
                dx=dx1+j; %add this to the rounded down pth value which gives an average b/w rounded up and down value
                rm = rem(i,10);
                if rm ==0
                    fprintf ('D%g\t', i/10) , fprintf ('%.2f\n',dx) %prints the interpolated value
                end
            end
        end
    else
        de = i*(n+1)/100; %formula for exclusive if the value of k's values outside the range of 1/(n+1) in 0 to 1
        r = rem(k,(1/(n+1))); %remainder function to check if k is a multiple of 1/(n+1)
        if r==0 %if multiple then no interpolation needed
            [j] = d(:,de);
            rm = rem(i,10);
            if rm ==0
                fprintf ('D%g\t', i/10) , fprintf ('%.2f\n',j) %value is printed
            else
            i = i + 1;
            end
        else
            Y = floor(de); %if k is not a multiple then we interpolate same as perviously 
            fract = de-Y;
            j = d(:,Y);
            j2 = d(:,Y+1);
            dx1 = (fract)*(abs(j2-j));
            dx=dx1+j;
            rm = rem(i,10);
            if rm ==0
                fprintf ('D%g\t', i/10) , fprintf ('%.2f\n',dx) 
            end
        end
    end
end
end



