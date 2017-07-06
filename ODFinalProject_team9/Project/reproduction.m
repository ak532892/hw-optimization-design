function [pool] = reproduction(population)
    %   �ƻs, ���L�����(���t��)
    global POPULATION_CNT GENETIC_LENGTH OBJECT_NUM
    
    Slack = POPULATION_CNT; % �ٳѴX�ӥi�ƻs
    has_copy = 1;
    pool(POPULATION_CNT).genes = zeros(1, GENETIC_LENGTH);
    pool(POPULATION_CNT).fitness = 0;
    pool(POPULATION_CNT).dec_value = zeros(1, OBJECT_NUM);
    
	%   �p��Ҧ��A�����`�X
    fitness_sum = sum([population.fitness]);
    
	%   �p��C�ӥ������ƻs�X�Ө��t�����A�ê������ƻs
    for i = 1:POPULATION_CNT
        if Slack == 0, break, end;
        
        %   �p�����ƻs�Ӽ�, �|�ˤ��J
        cnt = round(population(i).fitness/fitness_sum * POPULATION_CNT);
        %   �վ�i�ƻs�Ӽ�
        if(cnt > Slack), cnt = Slack; end;
        %   �}�l�i��ƻs
        for j = 1:cnt
            pool(has_copy) = population(i);
            has_copy = has_copy + 1;
        end
		%   �վ�Slack
		Slack = Slack - cnt;
    end

 	%   �Y�٦��S�ƻs����
    while (has_copy < POPULATION_CNT)
		%   �H���D�G�����P�V����X��
		pos1 = randi([1 POPULATION_CNT]);
        while 1
            pos2 = randi([1 POPULATION_CNT]);
            if pos1 ~= pos2, break, end;
        end
		%   ����n����������t���h
        if(population(pos1).fitness > population(pos2).fitness) 
            i = pos1;
        else
            i = pos2;
        end
        pool(has_copy) = population(i);
        has_copy = has_copy + 1;
    end
end