function population = crossover(pool, population)
    %   交配
    %   這裡只考慮母體個數為偶數個
    %   若母體個數為奇數個需再做額外判斷處理,否則發生記憶體寫入錯誤。
    global POPULATION_CNT GENETIC_LENGTH CROSSOVER_RATE
        
	cnt = 1;

    while(cnt < POPULATION_CNT)
		%   隨機選二個個體
        p1 = randi([1 POPULATION_CNT]);
        while 1
            p2 = randi([1 POPULATION_CNT]);
            if p1 ~= p2, break, end;
        end
        
        %   決定是否交配
        crossover_if = rand(1);
        
        if (crossover_if > CROSSOVER_RATE)
			%   不交配, 將交配池中之個體丟回母體
			population(cnt) = pool(p1);
            cnt = cnt+1;
            population(cnt) = pool(p2);
            cnt = cnt+1;
        else
            %   單點交配, 交配完後再丟回母體
            while 1
                pos = randi([1 GENETIC_LENGTH]);
                if pos ~= 0, break, end;
            end
 			%   crossover
            population(cnt).genes(1:pos) = pool(p1).genes(1:pos);
            population(cnt+1).genes(1:pos) = pool(p2).genes(1:pos);

            population(cnt+1).genes(pos:GENETIC_LENGTH) = pool(p1).genes(pos:GENETIC_LENGTH);
            population(cnt).genes(pos:GENETIC_LENGTH) = pool(p2).genes(pos:GENETIC_LENGTH);

			cnt = cnt + 2; % 已複製完二條
        end
    end
end    