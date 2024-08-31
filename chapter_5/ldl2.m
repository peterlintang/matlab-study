
function [l, d] = ldl2(A)
	% A 对称正定矩阵
	% A = LDL'
	% d对角阵, l下三角阵
	if ~isequal(A, A')
		error('Matrix must be symetric');
		return ;
	end

	n = length(A);
	v = eig(A);

	if ~all(v > 0)
		error('matrix must be positive');
		return ;
	end

	w(1) = A(1, 1);

	for i = 1 : n
		l(i, i) = 1;
	end

	l(2 : n, 1) = A(2 : n, 1) / w(1);

	for i = 2 : n
		s = 0;
		for kk = 1 : (i - 1)
			s = s + l(i, kk) ^ 2 * w(kk);
		end
		w(i) = A(i, i) -s;
		for j = (i + 1) : n
			s = 0;
			for kk = 1 : (i - 1)
				s = s + l(j, kk) * l(i, kk) * w(kk);
			end
			l(j, i) = (A(j, i) - s) / w(i);
		end
	end
	d = diag(w);
end


