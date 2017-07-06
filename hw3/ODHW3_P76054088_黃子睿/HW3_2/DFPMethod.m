function [xMin, fMin] = DFPMethod(func, xi, eps, B)

syms x1 x2 x3
f = feval(func, [x1, x2 x3]);
grad = gradient(f);

iter = 1;
plot(iter, feval(func, xi), 'go');
hold on;
title('DFP Method');
xlabel('Iteration');
ylabel('Value');
while 1
    % step 1
    GRAD = double(subs(grad, [x1 x2 x3], xi'));

    if norm(GRAD) < eps
        xMin = xi;
        break;
    end
    S = -B*GRAD;

    % step 2
    syms lambda
    f = diff(feval(func, xi' + lambda*S'));
    lambdaMin = vpasolve(f == 0, lambda);
    [pos, ~] = size(lambdaMin);
    % range -10 <= xi <=10
    find = 0;
    for i = 1:pos
        xi1 = double(xi + lambdaMin(i)*S);
        if ((-10 <= xi1(1)) && (xi1(1) <= 10)) && ((-10 <= xi1(2)) && (xi1(2) <= 10)) && ...
           ((-10 <= xi1(3)) && (xi1(3) <= 10))
            find = 1;
            break;
        end
    end   
    if find == 0
       xMin = xi;
       break;
    end
        
    GRADI1 = subs(grad, [x1 x2 x3], xi1');
    if norm(GRADI1) < eps
        xMin = xi1;
        break;
    end
    
    % step 3
    g = GRADI1 - GRAD;
    B = B + (lambdaMin(i)*S*S')/(S'*g) + -(B*g*(B*g)')/(g'*B*g);
    
    % step 4
    xi = xi1;
    iter = iter+1;
    if iter > 100
        xMin = xi;
        break;
    end
    plot(iter, feval(func, xi), 'go');
    hold on;
end

fMin = double(feval(func, xMin));

end