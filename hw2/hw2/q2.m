%Try to transform n-dimensional search to 1-dimensional search
clc
clear all
global  X FUNC S ndim
ndim = 2; %suppose the objective function is 2-dimensional (that is, 2-variable)
S = [1;0];%search direction. You need to change this if you have a different direction
k = 1;
X = [-2;2]%starting point. You can start from a different point
x(k) = X(1);
y(k) = X(2);
FUNC = @q2myfunc;
eps = 1;
fMin = feval(@q2myfunc, X)
fp = feval(@q2fLine, eps);
fm = feval(@q2fLine, -eps);

if fp < fMin
    dir = 1;
elseif fm < fMin
    dir = -1;
else
    dir = 1;
end

[nu, ~] = q2goldSearch(@q2fLine, -5, 5, dir);
%here the initial interval for golden section is [-10, 10]. Actually you should use some algorithm to get a better initial interval.

tol = 1.0e-5;
X = X + dir*nu*S % the next point
k = k+1;
x(k) = X(1);
y(k) = X(2);
prefMin = fMin;
fMin = feval(@q2myfunc, X)
while(abs(prefMin-fMin) > tol)
    if k > 100
        break;
    end
    S = double(~S);
    fp = feval(@q2fLine, eps);
    fm = feval(@q2fLine, eps);

    if fp < fMin
        dir = 1;
    elseif fm < fMin
        dir = -1;
    else
        dir = 1;
    end
    %If you use the Univariate method, the next search direction S=[0;1];
    %Anyway, keep searching (by using the while loop) until the stopping criterion is met.
    [nu, ~] = q2goldSearch(@q2fLine, -5, 5, dir) ;
    X = X + dir*nu*S % the next point
    prefMin = fMin;
    fMin = feval(@q2myfunc, X)
    k = k+1;
    x(k) = X(1);
    y(k) = X(2);
end
im = figure;
plot(x, y, 'r');
xlabel('x1');
ylabel('x2');
title(['function value=',num2str(fMin), ', x1=',num2str(x(k)), ', x2=',num2str(y(k))]);
saveas(im, 'q2.jpg');
X %Xmin
fMin