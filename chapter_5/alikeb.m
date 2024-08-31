
function [y, p] = alikeb(A, B)
	% 判断矩阵A B是否相似,并返回可逆矩阵p, 使得A = inv(p)*B*p
	% y: 1 相似，0 不相似
	% p: 可逆矩阵 A = inv(p)*B*p
	y = 1;
	p = [];
	if ~besquare(A) | ~besquare(B)
		y = 0;
		error(' the matrixes should be square');
		return;
	end
	na = length(A);
	nb = length(B);
	if na ~= nb
		y = 0;
		return;
	end
	n = na;
	ea = eig(A);
	ea = real(ea);
	eb = eig(B);
	eb = real(eb);
	for i = 1 : n - 1
		for j = i + 1 : n
			if ea(i) > ea(j)
				temp = ea(i);
				ea(i) = ea(j);
				ea(j) = temp;
			end
			if eb(i) > eb(j)
				temp = eb(i);
				eb(i) = eb(j);
				eb(j) = temp;
			end
		end
	end
	if ~all(abs(ea - eb) < 10 * eps)
		y = 0;
		return ;
	end
	[ya ja] = jordan(A);
	[yb jb] = jordan(B);
	if ~all(abs(ja - jb) < 10 * eps)
		y = 0;
		return ;
	end
	p = yb * inv(ya);
end



