function [x] = cal_xvalue(x)
    %   binary 2 dec，將染色體中的二進位(genes) ，轉為實際可用之十進位(dec_value)
    global GENETIC_LENGTH 
    global OBJECT_NUM OBJECT_WEIGHT
    global MAX_WEIGHT
    
    gene_length = GENETIC_LENGTH / OBJECT_NUM;
    
    for i = 1:OBJECT_NUM
        dec = 0;
        for j = 1:gene_length
            if x.genes(gene_length*(i-1)+j) == 1
                dec = dec + 2^(j-1);
            end
            x.dec_value(i) = dec;
        end
    end
    
    %-------檢查是否超過重量-------%
    total_weight = sum(x.dec_value.*OBJECT_WEIGHT);
    
    %-------超過重量隨機選出1個數量>0的物品  --------%
    %-------數量 -1 並且更改x的基因組和10進位 -------%
	stack(gene_length) = 0;
	while total_weight > MAX_WEIGHT
        j = randi([1, OBJECT_NUM]); %隨機挑出1個物品
        while( x.dec_value(j) == 0) %找到數量大於0的第j件物品
            j = randi([1, OBJECT_NUM]);
        end
        item_num = x.dec_value(j) - 1; %去掉一件物品
        x.dec_value(j) = item_num; %更新10進位
        k = 1;
        stack(:) = 0;
        while item_num > 0
            stack(k)= mod(item_num, 2);
            item_num = floor(item_num / 2);
            k = k + 1;
        end
        x.genes(gene_length*(j-1)+1:gene_length*j) = stack;
        %-------更新總重量------%
        total_weight = sum(x.dec_value.*OBJECT_WEIGHT);
	end
end