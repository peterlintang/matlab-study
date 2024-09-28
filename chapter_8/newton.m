
function [yy, c] = newton(x, y, z)
	%牛顿法拟合曲线函数
	% x y 拟合原始数据，yy返回拟合多项式
	% z存在，c存放对应插值结果
	nx = length(x);
	ny = length(y);

	if nx ~= ny
		warning('the lengths of x and y should be equal');
	end

	n = min(nx, ny);
	if n < 2
		error('the number of the data should be greater than 1');
		return ;
	end

	yy = 0;
	d = y;
	for i = 1 : (n - 1)
		for j = n : -1 : (i + 1)
			if abs(x(i) - x(j)) < 10 * eps
				error('data input error');
				return;
			end
			d(j)=(d(j-1)-d(j))/(x(j-i)-x(j));
		end
	end
	yy = d(n);
	for i = (n - 1) : -1 : 1
		ym = conv(yy, [1; -x(i)]);
		yy = pplus(d(i), ym);
	end

	if nargout == 2
		c = polyval(yy, z);
	end
end














