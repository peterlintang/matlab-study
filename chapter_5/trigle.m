
function y = trigle(A)
	%判断矩阵A是否可对角化
	y = 1;
	c = size(A);

	if (c(1) ~= c(2))
		y = 0;
		return;
	end

	e = eig(A);
	n = length(A);
	while 1
		if isempty(e)
			return ;
		end
		d = e(1);
		f = sum(abs(e - d) < 10 * eps);
		g = n - rank(A - d * eye(n));
		if (f ~= g)
			y = 0;
			return;
		end
		e(find(abs(e - d) < 10 * eps)) = [ ];
	end
end
