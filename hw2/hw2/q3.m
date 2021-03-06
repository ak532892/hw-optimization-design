%Try to transform n-dimensional search to 1-dimensional search
clc
clear all
global  X FUNC S ndim
ndim = 2; %suppose the objective function is 2-dimensional (that is, 2-variable)
S = [1;0];%search direction. You need to change this if you have a different direction
k = 1;
X = [-20;20]%starting point. You can start from a different point
x(k) = X(1);
y(k) = X(2);
FUNC = @q3myfunc;
eps = 0.01;
fMin = feval(@q3myfunc, X)
fp = feval(@q3fLine, eps);
fm = feval(@q3fLine, -eps);

if fp < fMin
    dir = 1;
elseif fm < fMin
    dir = -1;
end

[nu, ~] = q3goldSearch(@q3fLine, -5, 5, dir);
%here the initial interval for golden section is [-10, 10]. Actually you should use some algorithm to get a better initial interval.

tol = 1.0e-8;
X = X + dir*nu*S % the next point
k = k+1;
x(k) = X(1);
y(k) = X(2);
prefMin = fMin;
fMin = feval(@q3myfunc, X)
n = 5;
while(abs(prefMin-fMin) > tol)
    if mod(k, n) == 0
        S = [x(k)-x(k-2);y(k)-y(k-2)];
    else
        S = double(~S);
    end
    if k == 100
        break;
    end
    fp = feval(@q3fLine, eps);
    fm = feval(@q3fLine, -eps);

    if fp < fMin
        dir = 1;
    elseif fm < fMin
        dir = -1;
    else
        dir = 1;
    end
    %If you use the Univariate method, the next search direction S=[0;1];
    %Anyway, keep searching (by using the while loop) until the stopping criterion is met.
    [nu, ~] = q3goldSearch(@q3fLine, -5, 5, dir) ;
    X = X + dir*nu*S % the next point
    if mod(k, n) == 0
        S = [1;0];
    end
    prefMin = fMin;
    fMin = feval(@q3myfunc, X)
    k = k+1;
    x(k) = X(1);
    y(k) = X(2);
end
im = figure;
plot(x, y, 'r');
xlabel('x1');
ylabel('x2');
title(['function value=',num2str(fMin), ', x1=',num2str(x(k)), ', x2=',num2str(y(k))]);
saveas(im, 'q3.jpg');
X %Xmin
fMin