
function y = comsimpson(f, a, b, n)
	%积分与例子不太一样page293
	%复合辛普生法求积分
	s = evalf(f, a) - evalf(f, b);
	h = (b - a) / (2 * n);
	x = a;
	for i = 1 : 2 : (2 * n - 1)
		r = x + h;
		s = s + 4 * evalf(f, x);
		x = x + h;
		s = s + 2 * evalf(f, x);
	end
	s = s * h / 3.0;
	y = s;
end
