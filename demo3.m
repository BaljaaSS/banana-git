function [x,y] = demo3(n)

    x = linspace(0,1,n);
    y = sin(4*pi*x);

plot(x,y);
