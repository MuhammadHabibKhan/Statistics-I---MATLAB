function [] = c_quartiledeviation(d) %takes input ungrouped data
d = sort(d); %sorts the data in ascending order
n = length(d); %length command calculates the number of values in data
r = rem(n,2); %remainder; 
if r >0 
    for k = 1:3 %for loop condition to print the three quartiles
        if k==2
            continue
        end
        Q = k*(n+1)/4; %formula of ungrouped quartiles
        Z = round(Q);
        l = Z-Q;
        if l == 0
            [j] = d(:,Q);
            if k==1
                Q1=j;
            end
            if k==3
                Q3=j;
            end
            fprintf ('q%g\t', k) , fprintf ('%.2f\n',j) %prints each quartile        
            k = k + 1; %continuation of loop
        else
            Y = floor(Q);
            p = Q-Y;
            j1 = d(:,Y);
            j2 = d(:,Y+1);
            qx = Y+(p*(j2-j1));
            m = isfloat(qx);
            if m==1
                u = floor(qx);
                i = d(:,u);
                i2 = d(u+1);
                j = [i+i2]/2;
                if k==1
                    Q1=j;
                end
                if k==3
                    Q3=j;
                end
                fprintf ('q%g\t', k) , fprintf ('%.2f\n',[j]) %prints each quartile
                k = k + 1; %continuation of loop
            else    
                j = d(:,fix(qx));
                if k==1
                    Q1=j;
                end
                if k==3
                    Q3=j;
                end
                fprintf ('q%g\t', k) , fprintf ('%.2f\n',[j]) %prints each quartile
                k = k + 1; %continuation of loop
            end    
        end
    end
    c_QD = (Q3-Q1)/(Q1+Q3);
    fprintf ('Coefficient of Quartile Deviation:  %.2f\n',c_QD)
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
        q11x = g1(:,floor(q));
        q33x = g3(:,floor(q));
        [i,j]=max(g1);
        if j==q11x
            t=disp(q);
            x = d(:,1);
            y = d(:,2);
            w= y-x;
            t1 = t+w;
            qx = (t+t1)/2;
            q11x = g1(:,floor(qx));
            q33x = g3(:,floor(qx));
            q1x = g1(:,floor(qx+1));
            q3x = g3(:,floor(qx+1));
            q1 = (q1x+q11x)/2;
            q3 = (q3x+q33x)/2;
            fprintf ('q1\t') , fprintf ('%.2f\n',q1)
            fprintf ('q3\t') , fprintf ('%.2f\n',q3)
        else
            q1x = g1(:,floor(q+1));
            q3x = g3(:,floor(q+1));
            q1 = (q11x+q1x)/2;
            q3 = (q33x+q3x)/2;
            fprintf ('q1\t') , fprintf ('%.2f\n',q1)
            fprintf ('q3\t') , fprintf ('%.2f\n',q3)          
        end
    end
c_QD = (q3-q1)/(q3+q1);
fprintf ('Coefficient of Quartile Deviation:  %.2f\n',c_QD)    
end
end