function [xMin, fMin] = NewtonsMethod(func, xi, eps)

syms x1 x2 x3
f = feval(func, [x1, x2, x3]);
h = hessian(f);
grad = gradient(f);

iter = 1;
plot(iter, feval(func, xi), 'ro');
hold on;
title('Newtons Method');
xlabel('Iteration');
ylabel('Value');

while 1
    H = subs(h, [x1 x2 x3], xi');
    GRAD = subs(grad, [x1 x2 x3], xi');

    if norm(GRAD) < eps
        xMin = xi;
        break;
    end

    % inv(H) * GRAD = H\GRAD 
    xi1 = double(xi - H\GRAD);
    if ~(((-10 <= xi1(1)) && (xi1(1) <= 10)) && ((-10 <= xi1(2)) && (xi1(2) <= 10)) && ...
       ((-10 <= xi1(3)) && (xi1(3) <= 10)))
        xMin = xi;
        break;
    end
    
    xi = xi1;
    iter = iter+1;
    if iter > 100
        xMin = xi;
        break;
    end
    plot(iter, feval(func, xi), 'ro');
    hold on;
end
fMin = feval(func, xMin);

end