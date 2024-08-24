
function [y] = ltol(v1, p1, v2, p2)
	%异面直线的距离
	%x=y/2=z/3 x-1=y+1=z-2
	% v1 = [1 2 3], p1 = [0 0 0]
	% v2 = [1 1 1], p2 = [1 -1 2]
	if iscline(v1, v2)
		error('arguments input error');
	end
	pp = p1 - p2;
	d = radvec(mixed_product(v1, v2, pp)) / radvec(cross_product(v1, v2));
	y = abs(d);
end
