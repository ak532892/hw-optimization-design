% Fletcher-Reeves method
clc
clear all

% different starting points
xi1 = [0;0;0];
xi2 = [10;10;10];
xi3 = [-10;-10;-10];
eps = 1e-6;
digits(4);
n = 10;

[localxMin1, localfMin1] = FletcherReevesMethod(@func, xi1, eps, n)
figure;
[localxMin2, localfMin2] = FletcherReevesMethod(@func, xi2, eps, n)
figure;
[localxMin3, localfMin3] = FletcherReevesMethod(@func, xi3, eps, n)

if ((localfMin3 > localfMin1) && (localfMin2 > localfMin1))
    globalxMin =  localxMin1
    globalfMin =  localfMin1
end
if ((localfMin3 > localfMin2) && (localfMin1 > localfMin2))
    globalxMin =  localxMin2
    globalfMin =  localfMin2
end
if ((localfMin2 > localfMin3) && (localfMin1 > localfMin3))
    globalxMin =  localxMin3
    globalfMin =  localfMin3
end