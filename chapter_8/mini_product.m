
function [a, e, yy] = mini_product(f, x, y, xx)
	%最佳均方逼近
	%f 参加逼近的所有函数名组成的字符串矩阵，每个函数名占一行，每行字符数相同，不同空格补齐
	%x, y原始数据的第一坐标和函数值
	%xx 插值的点的第一坐标向量
	% page288 example
	m = size(f);
	m = m(1);
	n = length(x);
	b = zeros(m, m);
	c = zeros(m, 1);

	if n ~= length(y)
		error('x and y should be the same size');
		return;
	end
	for j = 1 : m
		for k = 1 : m
			b(j, k) = 0;
			for i = 1 : n
				b(j, k) = b(j, k) + evalf(f(j, :), x(i)) * evalf(f(k, :), x(i));
			end
		end
		c(j) = 0;
		for i = 1 : n
			c(j) = c(j) + evalf(f(j, :), x(i)) * y(i);
		end
	end
	a = b\c;
	e = 0;
	for i = 1 : n
		ff = 0;
		for j = 1 : m
			ff = ff + a(j) * evalf(f(j, :), x(i));
		end
		e = e + (y(i) - ff) * (y(i) - ff);
	end
	if nargin == 3
		return;
	end
	yy = [];
	for i = 1 : m
		l = [];
		for j = 1 : length(xx)
			l = [l evalf(f(i, :), xx(j))];
		end
		yy = [yy l'];
	end
	yy = yy * a;
	a = a';
end

















