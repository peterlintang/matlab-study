
function [y]=dangle(v, flag)
	% 求向量与３个坐标轴的夹角
	y = zeros(3, 1);
	if (nargin == 1)
		flag = 0;
	end
	d = radvec(v);
	if (d == 0)
		error('d is a 0 vector');
	end
	y(1) = v(1) / d;
	y(2) = v(2) / d;
	y(3) = v(3) / d;

	if (flag ~= 0)
		y(1) = acos(y(1));
		y(2) = acos(y(2));
		y(3) = acos(y(3));
	end
end
