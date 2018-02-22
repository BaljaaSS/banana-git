function [x,y] = demo3(n)

    x = linspace(0,1,n);
    y = sin(2*pi*x);

plot(y,x);