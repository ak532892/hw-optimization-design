clc
clearvars

global GENETIC_LENGTH POPULATION_CNT ITERA_CNT CROSSOVER_RATE MUTATION_RATE OBJECT_NUM OBJECT_VALUE OBJECT_WEIGHT MAX_WEIGHT
% ctr = 1;
% for MUTATION_RATE = 0.01:0.01:2
% ����P�Ѽ�
OBJECT_NUM = 12;                % ���~�ƶq
OBJECT_VALUE =  [ 30 50 25 12 15 6 5 11 4 20 10 5];	%���~����
OBJECT_WEIGHT = [ 1 3 3 2 3 2 2 5 2 11 7 4];        %���~���q
MAX_WEIGHT = 20;                %�I�]�̤j�t��
GENETIC_LENGTH = 2*OBJECT_NUM;  % ��]����
POPULATION_CNT = 50;           % ���s�ƶq
ITERA_CNT = 50;                % ���N����
CROSSOVER_RATE = 0.5;           % ��t�v
MUTATION_RATE = 0.1;            % ���ܲv

[population, best_gene] = initialize();

for i = 1:ITERA_CNT
    pool = reproduction(population);            % ���(���t��)
    population = crossover(pool, population);   % ��t
    [population, best_gene] = mutation(population, best_gene);  % ����
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