function [x] = cal_fitness(x)
    %   �A���禡�A���]�� X*value
    global OBJECT_VALUE

    x.fitness = sum(x.dec_value.*OBJECT_VALUE);
end