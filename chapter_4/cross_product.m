
function [y] = cross_product(a, b)
	%求向量的向量积
	a = reshape(a, 3, 1);
	b = reshape(b, 3, 1);
	c = eye(3);
	y(1) = -det([b a c(:, 1)]);
	y(2) = -det([b a c(:, 2)]);
	y(3) = -det([b a c(:, 3)]);
end
