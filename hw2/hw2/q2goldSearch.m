function [ xMin, fMin] = q2goldSearch(funcname, a, b, dir, tol)

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%funcname=@func;
if nargin <5
    tol=1.0e-6;
end;

R=(sqrt(5)-1)/2;
C=1 - R;

x1=R*a+ C*b;
x2=C*a +R*b;
f1=feval(funcname,x1*dir);
f2=feval(funcname,x2*dir);

%for i=1:nIter
while (b-a)>tol
    if f1>f2
        a=x1;x1=x2;f1=f2;
        x2= C*a + R*b;
        f2= feval(funcname,x2*dir);
    else
        b=x2; x2=x1; f2=f1;
        x1= R*a + C*b;
        f1= feval(funcname,x1*dir);
    end;
end;

if f1< f2
    fMin=f1; xMin=x1;
else
    fMin=f2; xMin=x2;
end;

% xMin
% fMin

end
