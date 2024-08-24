
function [y] = vtov(v1, v2, flag)
	%向量夹角
	if nargin == 2
		flag = 0;
	end
	if flag == 0
		y = dotab(v1, v2) / radvec(v1) / radvec(v2);
	elseif flag == 1
		y = acos(dotab(v1, v2) / radvec(v1) / radvec(v2));
	elseif flag == 2
		y = acos(dotab(v1, v2) / radvec(v1) / radvec(v2)) * 180 / pi;
	end
end
