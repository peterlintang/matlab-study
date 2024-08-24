
function [y] = dotab(a, b)
	% 向量点积计算两个向量相应元素的乘积和
	y = 0;
	for i = 1 : length(a)
		y = y + a(i) * b(i);
	end
end
