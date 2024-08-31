
function y = expoly(p)
	%多项式因式分解
	%y: n * 3 矩阵，n为分解后的因子个数，矩阵的每行代表一个因子
	%
	s = p(1);
	r = roots(p);
	y = [];
	while ~isempty(r)
		c = r(1);
		r(1) = [];
		if imag(c) > eps
			cc = conv([1 -c], [1 -conj(c)]);
			y = [y; cc];
			r(find(abs(r - conj(c)) < eps)) = [];
		else
			c = real(c);
			cc = [0 1 -c];
			y = [y; cc];
		end
	end
	if abs(s - 1) > eps
		cc = [ 0 0 s ];
		y = [ y; cc ];
	end
end


