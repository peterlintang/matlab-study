
function [y] = radvec(v)
%	计算向量的长度
	y = sqrt(sum(sum(v.^2)));
end
