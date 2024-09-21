
function yy=pline(x, y)
	% 最小二乘法直线拟合
	nx = length(x);
	ny = length(y);

	if nx ~= ny
		warning('The lengths of x and y should be equal');
	end

	n = min(nx, ny);

	if n < 2
		error('the number of the data should be greater than 1');
		return;
	end

	x = x(1:n);
	y = y(1:n);
	x = reshape(x, n, 1);
	y = reshape(y, n, 1);
	A = [x ones(n, 1)];
	b = y;
	B = A'*A;
	b = A'*b;
	yy = B\b;
	yy = yy';
end




