
function [y] = ptol(p, v, vp)
	%点到直线的距离
	% 直线永点[x0 y0 z0]和向量v[A B C]表示
	% (x - x0) / A = (y - y0) / B = (z - z0) / C
	vs = vp - p;
	d = radvec(v);
	if (abs(d) < eps)
		error('input argument error for v');
	end
	y = abs(radvec(cross_product(vs, v)) / d);
end
