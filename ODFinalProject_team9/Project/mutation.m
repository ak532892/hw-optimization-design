function [population, best_gene] = mutation(population, best_gene)
    %	����
    global POPULATION_CNT MUTATION_RATE GENETIC_LENGTH
    
    for i = 1:POPULATION_CNT
        mutation_if = rand(1);
        
        if (mutation_if <= MUTATION_RATE)
			pos = randi([1 GENETIC_LENGTH]);    % ���ܦ�m
			population(i).genes(pos) =  ~population(i).genes(pos);
        end
        %   ���ܧ���A��@������A����
		population(i) = cal_xvalue(population(i));  % �����]�������i��x��
		population(i) = cal_fitness(population(i)); % �A�N�i��x�ȥN�J�A���禡
		%   �A��sbest_gene
        
        if (population(i).fitness > best_gene.fitness)
			best_gene = population(i);
        end
    end
end