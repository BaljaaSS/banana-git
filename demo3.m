function [x,y] = demo3(n)

    x = linspace(0,2,n);
    y = sin(2*pi*x);

plot(x,y);
