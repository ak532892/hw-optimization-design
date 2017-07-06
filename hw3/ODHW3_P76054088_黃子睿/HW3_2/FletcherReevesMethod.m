function [xMin, fMin] = FletcherReevesMethod(func, yk, eps, n)

syms x1 x2 x3
f = feval(func, [x1, x2 x3]);
grad = gradient(f);

j = 1;
iter = 1;
plot(iter, feval(func, yk), 'bo');
hold on;
title('Fletcher Reeves Method');
xlabel('Iteration');
ylabel('Value');
while 1
    % step 1
    xj = yk;
    
    % step 2
    GRAD = subs(grad, [x1 x2 x3], xj');
    S = -GRAD;
    
    % step 3
    first = true;
    while (j < n) | first;
        if norm(S) < eps
            xMin = xj;
            fMin = double(feval(func, xMin));
            return;
        end

        syms lambda
        f = diff(feval(func, xj' + lambda*S'));
        lambdaMin = (vpasolve(f == 0, lambda));
        [pos, ~] = size(lambdaMin);

        % range -10 <= xi <=10
        find = 0;
        for i = 1:pos
            xj1 = double(xj + lambdaMin(i)*S);
            if ((-10 <= xj1(1)) && (xj1(1) <= 10)) && ((-10 <= xj1(2)) && (xj1(2) <= 10)) && ...
               ((-10 <= xj1(3)) && (xj1(3) <= 10))
                find = 1;
                break;
            end
        end
        if find == 0
            xMin = xj;
            fMin = double(feval(func, xMin));
            return;
        end

        % step 4
        GRAD = subs(grad, [x1 x2 x3], xj');
        GRADJ1 = subs(grad, [x1 x2 x3], xj1');
        B = (GRADJ1'*GRADJ1) / (GRAD'*GRAD);
        
        S = double(-GRADJ1 + B*S);

        xj = xj1;
        j = j + 1;
        first = false;
    end
    
    % step 5
    j = 1; yk = xj1;
    iter = iter+1;
    if iter > 100
        xMin = xj;
        fMin = double(feval(func, xMin));
        return;
    end
    plot(iter, feval(func, yk), 'bo');
    hold on;
end

end