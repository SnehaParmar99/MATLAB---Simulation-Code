%To implement AND function using ADALINE with bipolar inputs and outputs
%PROGRAM:
clear all;
clc;
disp('adaline network for and function bipolar inputs, bipolar targets');
   % x1=[1 1 -1 -1]; %input pattern
    x1=[0.3142    0.2627    0.2186    0.1704    0.1178    0.0633    0.0097   -0.0399]
   % x2=[1 -1 1 -1]; %input pattern
    x2=[0.2000    0.0857    0.0735    0.0805    0.0876    0.0908    0.0894    0.0826]
   % x3=[1 1 1 1];   %x3 for bias
   x3=[1 1 1 1 1 1 1 1];
    t=[0.5142    0.4411    0.4828    0.5253    0.5451    0.5365    0.4957    0.3952];   %target
    w1=0.1;
    w2=0.1;
    b=0.1;
    alpha=0.1;
    e=2;
    delw1=0;
    delw2=0;
    delb=0;
    epoch=0;
    while(e>0.05)
        epoch=epoch+1
        e=0;
        for i=1:8
            nety(i)=w1*x1(i)+w2*x2(i)+b;
            nt=[nety(i) t(i)];  %netinput,target
            delw1=alpha*(t(i)-nety(i))*x1(i);
            delw2=alpha*(t(i)-nety(i))*x2(i);
            delb=alpha*(t(i)-nety(i))*x3(i);
            wc=[delw1 delw2 delb];  %weight chanches
            w1=w1+delw1;            %updating of weights
            w2=w2+delw2;
            b=b+delb;
            w=[w1 w2 b];            %weights
            x=[x1(i) x2(i) x3(i)];  %input pattern
            pr=[x nt wc w]          %to print the result
        end
        for i=1:8
            nety(i)=w1*x1(i)+w2*x2(i)+b;
            e=e+(t(i)-nety(i))^2;
        end
    end
