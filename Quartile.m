function [] = Quartile(d) %takes input ungrouped data
d = sort(d); %sorts the data in ascending order
n = length(d); %length command calculates the number of values in data
r = rem(n,2); %remainder; 
if r >0 
    for k = 1:3 %for loop condition to print the three quartiles
        Q = k*(n+1)/4; %formula of ungrouped quartiles
        Z = round(Q);
        l = Z-Q;
        if l == 0
            [j] = d(:,Q);
            fprintf ('q%g\t', k) , fprintf ('%.2f\n',j) %prints each quartile        
            k = k + 1; %continuation of loop
        else
            Y = floor(Q);
            p = Q-Y;
            j = d(:,Y);
            j2 = d(:,Y+1);
            qx = Y+(p*(j2-j));
            m = isfloat(qx);
            if m==1
                u = floor(qx);
                i = d(:,u);
                i2 = d(u+1);
                q2x = [i+i2]/2;
                fprintf ('q%g\t', k) , fprintf ('%.2f\n',[q2x]) %prints each quartile
                k = k + 1; %continuation of loop
            else    
                x = d(:,fix(qx));
                fprintf ('q%g\t', k) , fprintf ('%.2f\n',[x]) %prints each quartile
                k = k + 1; %continuation of loop
            end    
        end
    end
else
    h = n/2;
    g1 = d(1:h);
    g3 = d(h+1:end);
    q = ((h+1)/2);
    z = round(q);
    l = z-q;
    if l==0
        q1 = g1(:,q);
        q3 = g3(:,q);
        fprintf ('q1\t') , fprintf ('%.2f\n',q1)
        fprintf ('q3\t') , fprintf ('%.2f\n',q3)
    else
        q1 = g1(:,floor(q));
        q3 = g3(:,floor(q));
        [i,j]=max(g1);
        if j==q1
            t=disp(q);
            x = d(:,1);
            y = d(:,2);
            w= y-x;
            t1 = t+w;
            qx = (t+t1)/2;
            q1 = g1(:,floor(qx));
            q3 = g3(:,floor(qx));
            q1x = g1(:,floor(qx+1));
            q3x = g3(:,floor(qx+1));
            q11x = (q1x+q1)/2;
            q33x = (q3x+q3)/2;
            fprintf ('q1\t') , fprintf ('%.2f\n',q11x)
            fprintf ('q3\t') , fprintf ('%.2f\n',q33x)
        else
            q1x = g1(:,floor(q+1));
            q3x = g3(:,floor(q+1));
            q11x = (q1+q1x)/2;
            q33x = (q3+q3x)/2;
            fprintf ('q1\t') , fprintf ('%.2f\n',q11x)
            fprintf ('q3\t') , fprintf ('%.2f\n',q33x)
        end
    end
    q2 = (n+1)/2;
    y = floor(q2);
    j = d(:,y);
    j2=d(y+1);
    q2x = (j+j2)/2; 
    fprintf ('q2\t') , fprintf ('%.2f\n',q2x)
end
end

    






