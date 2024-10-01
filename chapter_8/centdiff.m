
function y = centdiff(f, a, h, tol, maxit)
	%中心差分法求微分
	%f字符串，求微分的函数函数名
	%a初始步长,一般选0.1--0.01间数值较合适
	%tol计算精度,一般选1e-4
	%maxit计算循环次数
	ff = evalf(f, a);
	if nargin <= 4
		maxit = 1000;
	end

	for i = 1 : maxit
		gg = (evalf(f, (a + h)) - evalf(f, (a - h))) / (2 * h);
		if abs(gg - ff) < tol
			y = gg;
			return;
		end
		h = h * 0.5;
		ff = gg;
	end
	y = gg;
end
