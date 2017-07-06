%Try to 1-dimensional search  
clc
clear all

global H1 H2 H3
im1 = figure;
[xMin, fMin] = q1goldSearch(@q1myfunc, -1, 4, 1) 
[xMin, fMin] = q1dicSearch(@q1myfunc, -1, 4, 1) 
%here the initial interval for golden section is [-1, 4].

x = linspace(-1, 4, 100);
y = (x.^2).*cos(x);

H1 = plot(x, y, 'r');

title('local minimum');
hLegend = legend([H1, H2, H3], 'f(x)', 'Golden section', 'Dichotomous');
saveas(im1, 'q1-1.jpg');
hold on;

im2 = figure(2);

[xMax, fMax] = q1goldSearch(@q1myfunc2, -1, 4, -1) 
[xMax, fMax] = q1dicSearch(@q1myfunc2, -1, 4, -1) 
%here the initial interval for golden section is [-1, 4].

x = linspace(-1, 4, 100);
y = (x.^2).*cos(x);
H1 = plot(x, y, 'r');

title('local maximum ');
hLegend = legend([H1, H2, H3], 'f(x)', 'Golden section', 'Dichotomous');

hold on;
saveas(im2, 'q1-2.jpg');