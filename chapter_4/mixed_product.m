
function [y] = mixed_product(a, b, c)
	%向量的混合积
	y = dotab(cross_product(a, b), c);
end
