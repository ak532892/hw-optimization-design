function [ xMin, fMin ] = q1dicSearch(funcname, a, b, maxmin, tol)

%UNTITLED2 Summary of this function goes here 
%   Detailed explanation goes here 

if nargin < 5
    tol = 1.0e-5; 
end; 

k = 1;
eps = 1e-6;
mid = (a+b)/2;
x(k) = mid;
y(k) = feval(funcname, mid)*maxmin; 

f1 = feval(funcname, mid-eps);
f2 = feval(funcname, mid+eps);
while abs(b - a) > tol
    k = k + 1;
    if f1 > f2
        a = mid-eps;
    else
        b = mid+eps;
    end
    mid = (a+b)/2;
    x(k) = mid;
    y(k) = feval(funcname, mid)*maxmin;
    f1 = feval(funcname, mid-eps); 
    f2 = feval(funcname, mid+eps); 
end

global H3
H3 = plot(x, y, '-ob');

xMin = (b + a) / 2;
fMin = feval(funcname, xMin)*maxmin; 

% xMin 
% fMin 

end