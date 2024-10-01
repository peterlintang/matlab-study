
function y = guass(f, a, b, n)
	%积分出来的结果与例子不一样page293
	%似抛物线公式求高斯积分
	%f求积分函数名，字符串
	%[a,b]积分区间
	%n分段数，分段越多，积分越精确,所需时间也多
	%n must be 2 * m
	h = (b - a) / n;
	y = 0;
	for i = 0 : (1 * n / 2 - 1)
		y = y + h * (evalf(f, a + h * (1 - 1 / sqrt(3)) + 2 * i) ...
			+ evalf(f, a + h * (1 + 1 / sqrt(3)) + 2 * i));
	end
end
