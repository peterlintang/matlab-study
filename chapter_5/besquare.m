
function y=besquare(A)
	%判断是否为方阵
	c = size(A);
	nx = c(1);
	ny = c(2);
	y = 1;
	if (nx ~= ny)
		y = 0;
		return;
	end
end
