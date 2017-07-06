function [x] = cal_fitness(x)
    %   適應函式，此設為 X*value
    global OBJECT_VALUE

    x.fitness = sum(x.dec_value.*OBJECT_VALUE);
end