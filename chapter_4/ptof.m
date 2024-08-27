
%example point [ 3 2 4], face 2x - 6y + 3z + 1 = 0; --> [2 -6 3 1]
function [y] = ptof(p, f)
	%点到平面的距离
	d1 = dotab(f, [p 1]);
	d2 = radvec(f(1 : 3));
	if (d2 == 0)
		error('ping mian ju zhen shu ru cuo wu');
	else
		y = abs(d1 / d2);
	end
end
