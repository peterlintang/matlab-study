
function [yy, c] = aimet(x0, y0, y1, xx)
	%埃尔密特法求多项式拟合
	%x0,y0为拟合的原始点(x0(i), y0(i))
	%y1在对应点的一阶导数值
	%xx参加插值的点的第一座标组成的向量
	%yy多项式系数
	%c对应xx的插值向量
	%p280 对应例子得不到相同数据?????
	n = min(length(x0), min(length(y0), length(y1)));
	if n ~= length(x0) | n ~= length(y0) | n ~= length(y1)
		warning('the lengths of the arguments are not equals');
	end
	if n < 2
		error('not enough data, please check again');
		return;
	end

	yy = 0;
	for i = 1 : n
		h = 1;
		a = 0;
		for j = 1 : n
			if j ~= i
				if abs(x0(i) - x0(j)) < eps
					error(' data input error');
					return;
				end
				k = [1 -x0(j)]/(x0(i)-x0(j));
				kk = conv(k, k);
				h = conv(h, kk);
				a = 1 / (x0(i)-x0(j)) + a;
			end
		end
		k = [-1 x0(i)] * (2 * a * y0(i) - y1(i));
		kk = pplus(k, y0(i));
		kkk = conv(h, kk);
		yy = pplus(yy, kkk);
	end

	if nargin == 4
		c = polyval(yy, xx);
	end
end























