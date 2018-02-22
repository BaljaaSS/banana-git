function [x,y] = demo2(n)
% DEMO

    x = linspace(0,1,n);
    y = sin(2*pi*x);

    plot(x,y);
