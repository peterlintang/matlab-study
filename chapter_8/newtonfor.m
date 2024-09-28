
function [yy, c] = newtonfor(y, h, x0, xx)
	%牛顿格雷高里法拟合
	%y:第二坐标数据,
	%h为数据的第一座标的间隔
	%x0为第一个数据的第一坐标
	%xx插值点的第一坐标组成的向量, 若xx存在，输出参数c为相应插值点的值
	%yy多项式系数
	n = length(y);
	if n < 2
		error(' the number of the data should be greater than 1');
		return;
	end

	d = y;
	l = 1;
	for j = 2 : n
		for i = n : -1 : j
			d(i) = d(i) - d(i - 1);
		end
	end
	if abs(h) < eps
		error(' h is too small');
		return;
	end
	s = [1 -x0] / h;
	yy = 0;
	for j = 0 : (n - 1)
		f = 1;
		for i = 0 : (j - 1)
			k = pplus(s, -i) / (j - i);
			f = conv(k, f);
		end
		yy = pplus(yy, d(j + 1)*f);
	end
	if nargout == 3
		c = polyval(yy, xx);
	end
end




