
function yy=pplus(x, y)
	%两个多项式加法运算
	% p1 = [ 3 4 6 ], p2 = [ 5 2 -4 7 ]
	% pplus(p2, p1) pplus(p2, -p1)
	% yy 输出
	nx = length(x);
	x = reshape(x, 1, nx);
	ny = length(y);
	y = reshape(y, 1, ny);
	n = max(nx, ny);
	cc = zeros(1, n);

	if nx > ny
		cc(1, (nx - ny + 1) : nx) = y;
		yy = x + cc;
	elseif nx < ny
		cc(1, (ny - nx + 1) : ny) = x;
		yy = y + cc;
	else
		yy = x + y;
	end
end
