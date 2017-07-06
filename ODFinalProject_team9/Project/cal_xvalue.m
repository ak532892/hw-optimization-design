function [x] = cal_xvalue(x)
    %   binary 2 dec�A�N�V���餤���G�i��(genes) �A�ର��ڥi�Τ��Q�i��(dec_value)
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
    
    %-------�ˬd�O�_�W�L���q-------%
    total_weight = sum(x.dec_value.*OBJECT_WEIGHT);
    
    %-------�W�L���q�H����X1�Ӽƶq>0�����~  --------%
    %-------�ƶq -1 �åB���x����]�թM10�i�� -------%
	stack(gene_length) = 0;
	while total_weight > MAX_WEIGHT
        j = randi([1, OBJECT_NUM]); %�H���D�X1�Ӫ��~
        while( x.dec_value(j) == 0) %���ƶq�j��0����j�󪫫~
            j = randi([1, OBJECT_NUM]);
        end
        item_num = x.dec_value(j) - 1; %�h���@�󪫫~
        x.dec_value(j) = item_num; %��s10�i��
        k = 1;
        stack(:) = 0;
        while item_num > 0
            stack(k)= mod(item_num, 2);
            item_num = floor(item_num / 2);
            k = k + 1;
        end
        x.genes(gene_length*(j-1)+1:gene_length*j) = stack;
        %-------��s�`���q------%
        total_weight = sum(x.dec_value.*OBJECT_WEIGHT);
	end
end