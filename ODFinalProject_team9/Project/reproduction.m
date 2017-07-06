function [pool] = reproduction(population)
    %   複製, 輪盤式選擇(分配式)
    global POPULATION_CNT GENETIC_LENGTH OBJECT_NUM
    
    Slack = POPULATION_CNT; % 還剩幾個可複製
    has_copy = 1;
    pool(POPULATION_CNT).genes = zeros(1, GENETIC_LENGTH);
    pool(POPULATION_CNT).fitness = 0;
    pool(POPULATION_CNT).dec_value = zeros(1, OBJECT_NUM);
    
	%   計算所有適應值總合
    fitness_sum = sum([population.fitness]);
    
	%   計算每個母體應複製幾個到交配池中，並直接做複製
    for i = 1:POPULATION_CNT
        if Slack == 0, break, end;
        
        %   計算應複製個數, 四捨五入
        cnt = round(population(i).fitness/fitness_sum * POPULATION_CNT);
        %   調整可複製個數
        if(cnt > Slack), cnt = Slack; end;
        %   開始進行複製
        for j = 1:cnt
            pool(has_copy) = population(i);
            has_copy = has_copy + 1;
        end
		%   調整Slack
		Slack = Slack - cnt;
    end

 	%   若還有沒複製完的
    while (has_copy < POPULATION_CNT)
		%   隨機挑二條不同染色體出來
		pos1 = randi([1 POPULATION_CNT]);
        while 1
            pos2 = randi([1 POPULATION_CNT]);
            if pos1 ~= pos2, break, end;
        end
		%   比較好的那條丟到交配池去
        if(population(pos1).fitness > population(pos2).fitness) 
            i = pos1;
        else
            i = pos2;
        end
        pool(has_copy) = population(i);
        has_copy = has_copy + 1;
    end
end