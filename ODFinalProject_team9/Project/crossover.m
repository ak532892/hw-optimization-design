function population = crossover(pool, population)
    %   ��t
    %   �o�̥u�Ҽ{����ӼƬ����ƭ�
    %   �Y����ӼƬ��_�ƭӻݦA���B�~�P�_�B�z,�_�h�o�ͰO����g�J���~�C
    global POPULATION_CNT GENETIC_LENGTH CROSSOVER_RATE
        
	cnt = 1;

    while(cnt < POPULATION_CNT)
		%   �H����G�ӭ���
        p1 = randi([1 POPULATION_CNT]);
        while 1
            p2 = randi([1 POPULATION_CNT]);
            if p1 ~= p2, break, end;
        end
        
        %   �M�w�O�_��t
        crossover_if = rand(1);
        
        if (crossover_if > CROSSOVER_RATE)
			%   ����t, �N��t�����������^����
			population(cnt) = pool(p1);
            cnt = cnt+1;
            population(cnt) = pool(p2);
            cnt = cnt+1;
        else
            %   ���I��t, ��t����A��^����
            while 1
                pos = randi([1 GENETIC_LENGTH]);
                if pos ~= 0, break, end;
            end
 			%   crossover
            population(cnt).genes(1:pos) = pool(p1).genes(1:pos);
            population(cnt+1).genes(1:pos) = pool(p2).genes(1:pos);

            population(cnt+1).genes(pos:GENETIC_LENGTH) = pool(p1).genes(pos:GENETIC_LENGTH);
            population(cnt).genes(pos:GENETIC_LENGTH) = pool(p2).genes(pos:GENETIC_LENGTH);

			cnt = cnt + 2; % �w�ƻs���G��
        end
    end
end    