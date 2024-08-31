
function y = llt(A)
	% 正定矩阵分解, 使得y'*y = A, A对称且正定
	%
	if ~isequal(A, A')
		error('A must be symtrix');
		return ;
	end
	n = length(A);
	e = eig(A);
	if ~all(e > 0)
		error(' A must be positive');
		return ;
	end
	l(1, 1) = sqrt(A(1, 1));
	l(2 : n, 1) = A(2 : n, 1) / l(1, 1);

	for i = 2 : n
		sum = 0;
		for j = 1 : (i - 1)
			sum = sum + l(i, j) ^ 2;
		end
		l(i, i) = sqrt(A(i, i) - sum);
		for j = (i + 1) : n
			sum = 0;
			for k = 1 : (i - 1)
				sum = sum + l(j, k) * l(i, k);
			end
			l(j, i) = (A(j, i) - sum) / l(i, i);
		end
	end
	y = l';
end

