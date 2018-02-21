function [x,y] = demo(n)
% DEMO

x = linspace(0,1,n);
y = sin(2*pi*x);

plot(y,x)
