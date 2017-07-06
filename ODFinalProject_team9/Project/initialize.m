function [population, best_gene] = initialize
    %   初始化參數設定
    global POPULATION_CNT GENETIC_LENGTH
    
    population(POPULATION_CNT).genes = zeros(1, GENETIC_LENGTH);
    population(POPULATION_CNT).fitness = 0;
    population(POPULATION_CNT).dec_value = [0 0 0 0 0 0 0 0 0 0 0 0];
    for i = 1:POPULATION_CNT
        population(i).genes(:) = randi([0 1], 1, GENETIC_LENGTH);
        %   計算母體基因之進制值
        population(i) = cal_xvalue(population(i));
        %   計算母體對應之適應值
        population(i) = cal_fitness(population(i));

        %   更新best_gene
        if  (i == 1) || (population(i).fitness > best_gene.fitness)
            best_gene = population(i);
        end
     end
end