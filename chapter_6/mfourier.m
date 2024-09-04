
function [a0, an, bn] = mfourier(f)
	% 函数f的傅里叶展开
	syms n x
	a0 = int(f, -pi, pi) / pi;
	an = int(f*cos(n*x), -pi, pi) / pi;
	bn = int(f*sin(n*x), -pi, pi) / pi;
end
