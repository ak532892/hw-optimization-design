function [ xMin, fMin ] = q1goldSearch(funcname, a, b, maxmin, tol)

%UNTITLED2 Summary of this function goes here 
%   Detailed explanation goes here 

if nargin < 5 
    tol = 1.0e-6; 
end; 

k = 1;
R = (sqrt(5)-1) / 2;
C = 1 - R; 

x1 = R*a + C*b; 
x2 = C*a + R*b; 
f1 = feval(funcname, x1); 
f2 = feval(funcname, x2); 
x(k) = x1;
y(k) = f1*maxmin;

while (b-a) > tol
    k = k+1;
    if f1 > f2 
       a = x1; x1 = x2; f1 = f2; 
       x2 = C*a + R*b; 
       f2 = feval(funcname, x2); 
       x(k) = x2;
       y(k) = f2*maxmin;
   else 
       b = x2; x2 = x1; f2 = f1; 
       x1 = R*a + C*b; 
       f1 = feval(funcname, x1);
       x(k) = x1;
       y(k) = f1*maxmin;
   end; 
end; 

global H2
H2 = plot(x, y, '-og');
hold on;

if f1 > f2 
   fMin = y(k); xMin = x2; 
else
   fMin = y(k); xMin = x1; 
end; 

% xMin 
% fMin 

end