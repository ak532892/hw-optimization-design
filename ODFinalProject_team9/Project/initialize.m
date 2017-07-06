function [population, best_gene] = initialize
    %   ��l�ưѼƳ]�w
    global POPULATION_CNT GENETIC_LENGTH
    
    population(POPULATION_CNT).genes = zeros(1, GENETIC_LENGTH);
    population(POPULATION_CNT).fitness = 0;
    population(POPULATION_CNT).dec_value = [0 0 0 0 0 0 0 0 0 0 0 0];
    for i = 1:POPULATION_CNT
        population(i).genes(:) = randi([0 1], 1, GENETIC_LENGTH);
        %   �p������]���i���
        population(i) = cal_xvalue(population(i));
        %   �p�����������A����
        population(i) = cal_fitness(population(i));

        %   ��sbest_gene
        if  (i == 1) || (population(i).fitness > best_gene.fitness)
            best_gene = population(i);
        end
     end
end