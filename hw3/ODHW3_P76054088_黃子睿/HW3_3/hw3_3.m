% Optimization Toolbox Functions
clc
clear all

% different starting points
xi1 = [0, 0, 0];
xi2 = [10, 10, 10];
xi3 = [-10, -10, -10];

options = optimoptions('fmincon','Display','iter', 'Algorithm', 'sqp');
[localxMin1, localfMin1] = fmincon(@func, xi1, [], [], [], [], [-10, -10, -10], [10, 10, 10], [], options)
[localxMin2, localfMin2] = fmincon(@func, xi2, [], [], [], [], [-10, -10, -10], [10, 10, 10], [], options)
[localxMin3, localfMin3] = fmincon(@func, xi3, [], [], [], [], [-10, -10, -10], [10, 10, 10], [], options)

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