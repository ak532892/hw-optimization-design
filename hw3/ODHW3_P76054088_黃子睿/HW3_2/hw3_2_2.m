% Compare with others method
clc
clear all

% different starting points
xi1 = [0;0;0];
xi2 = [10;10;10];
xi3 = [-10;-10;-10];
eps = 1e-6;
digits(4);
n = 10;
B = eye(3);

figure
subplot(1, 3, 1);
[localxMin1N, localfMin1N] = NewtonsMethod(@func, xi1, eps)
subplot(1, 3, 2);
[localxMin1D, localfMin1D] = DFPMethod(@func, xi1, eps, B)
subplot(1, 3, 3);
[localxMin1F, localfMin1F] = FletcherReevesMethod(@func, xi1, eps, n)

figure;
subplot(1, 3, 1);
[localxMin2N, localfMin2N] = NewtonsMethod(@func, xi2, eps)
subplot(1, 3, 2);
[localxMin2D, localfMin2D] = DFPMethod(@func, xi2, eps, B)
subplot(1, 3, 3);
[localxMin2F, localfMin2F] = FletcherReevesMethod(@func, xi2, eps, n)

figure;
subplot(1, 3, 1);
[localxMin3N, localfMin3N] = NewtonsMethod(@func, xi3, eps)
subplot(1, 3, 2);
[localxMin3D, localfMin3D] = DFPMethod(@func, xi3, eps, B)
subplot(1, 3, 3);
[localxMin3F, localfMin3F] = FletcherReevesMethod(@func, xi3, eps, n)