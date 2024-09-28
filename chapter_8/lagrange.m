
function [yy, c]=lagrange(x, y, z)
	%拉格郎日法曲线拟合
	%x y 拟合数据, z存在，c为z中元素用拉格郎日法进行插值的结果
	% yy为多项式的系数
	nx = length(x);
	ny = length(y);

	if nx~=ny
		warning('the lengths of x and y should be equal');
	end

	n = min(nx, ny);
	if n < 2
		error('the number of the data should be greater than 1');
		return;
	end

	yy = 0;

	for i = 1 : n
		p = 1.0;
		for j = 1 : n
			if i ~= j
				if abs(x(i) - x(j)) < eps
					error('the data is error');
					return ;
				end
				ll = [1 0 - x(j)] / (x(i) - x(j));
				p = conv(p, ll);
			end
		end
		yy = pplus(yy, p * y(i));
	end

	if nargout == 2
		c = polyval(yy, z);
	end
end














