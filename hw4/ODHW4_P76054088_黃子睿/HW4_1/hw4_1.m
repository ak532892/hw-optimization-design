% Optimization Toolbox Functions
clc
clear all

M = [4 33 31];
d = [0.0298  0.044  0.044  0.0138  0.0329  0.0329  0.0279  0.025  0.025  0.0619  0.0317  0.0368];
A = [11.5 92.5 44.3 98.1 20.1 6.1 45.5 31.0 44.3];
i = 9;
n = 2;

cvx_begin
	variables F(i)
	minimize( sum( (F./A').^n ) )
	subject to
        d(1)*F(1) - d(2)*F(2) - d(3)*F(3) - M(1) == 0;
        -d(4)*F(3) + d(5)*F(4) + d(6)*F(5) - d(8)*F(6) - d(9)*F(7) - M(2) == 0;
        d(7)*F(5) - d(10)*F(7) + d(11)*F(8) - d(12)*F(9) - M(3) == 0
		F >= 0;
cvx_end

F