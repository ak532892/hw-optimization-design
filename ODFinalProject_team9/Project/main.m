clc
clearvars

global GENETIC_LENGTH POPULATION_CNT ITERA_CNT CROSSOVER_RATE MUTATION_RATE OBJECT_NUM OBJECT_VALUE OBJECT_WEIGHT MAX_WEIGHT
% ctr = 1;
% for MUTATION_RATE = 0.01:0.01:2
% 北ぃ把计
OBJECT_NUM = 12;                % 珇计秖
OBJECT_VALUE =  [ 30 50 25 12 15 6 5 11 4 20 10 5];	%珇基
OBJECT_WEIGHT = [ 1 3 3 2 3 2 2 5 2 11 7 4];        %珇秖
MAX_WEIGHT = 20;                %璉程璽
GENETIC_LENGTH = 2*OBJECT_NUM;  % 膀
POPULATION_CNT = 50;           % ダ竤计秖
ITERA_CNT = 50;                % Ω计
CROSSOVER_RATE = 0.5;           % ユ皌瞯
MUTATION_RATE = 0.1;            % 跑瞯

[population, best_gene] = initialize();

for i = 1:ITERA_CNT
    pool = reproduction(population);            % 匡拒(だ皌Α)
    population = crossover(pool, population);   % ユ皌
    [population, best_gene] = mutation(population, best_gene);  % 跑
end

%      x(ctr) = best_gene.fitness;
%      ctr = ctr+1;

fprintf('%3d times...\n', i);
for j = 1:POPULATION_CNT
    fprintf('population %d : ',j);
    fprintf('%d ',population(j).dec_value);
    fprintf('\t%d',population(j).fitness);
    fprintf('\n');
end
fprintf('\n========================\n');
fprintf('best gene: ');
fprintf('%d ',best_gene.dec_value);
fprintf('\nbest fitness: ');
fprintf('%d \n',best_gene.fitness);
% end

% plot(0.01:0.01:2, x, 'ro-');
% xlabel('Rate');
% ylabel('Best fitness value');