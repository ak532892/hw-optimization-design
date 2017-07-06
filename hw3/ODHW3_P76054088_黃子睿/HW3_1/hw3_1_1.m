% Newtons method
clc
clear all

% different starting points
xi1 = [0;0;0];
xi2 = [10;10;10];
xi3 = [-10;-10;-10];
eps = 1e-6;
digits(4);

[localxMin1, localfMin1] = NewtonsMethod(@func, xi1, eps)
[localxMin2, localfMin2] = NewtonsMethod(@func, xi2, eps)
[localxMin3, localfMin3] = NewtonsMethod(@func, xi3, eps)

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