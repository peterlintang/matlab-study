
function yn = deriv(x, y, z, n, flag)
	%多项式拟合函数求n阶数值函数导数
	if nargin == 4
		flag = 1;
	end
	if flag == 1
		p = lagrange(x, y);
	elseif flag == 2
		p = newton(x, y);
	else
		error(' flag is out of index');
		return;
	end
	for i = 1 : n
		p = polyder(p);
	end
	yn = polyval(p, z);
end
