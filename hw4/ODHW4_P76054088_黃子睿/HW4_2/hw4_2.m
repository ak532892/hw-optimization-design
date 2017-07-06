% CVX: Matlab Software
clc
clear all

cvx_begin
	variables y1 y2
	maximize( y1 - 5*y2 )
	subject to
		3*y1-2*y2 <= 12;
		2*y1+y2 >= 8;
		y1+y2 == 6;
		y1 >= 0;
cvx_end

y1, y2