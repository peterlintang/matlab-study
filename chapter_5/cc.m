
function [ks, kn, kr] = cc(A)
	% 生成矩阵A的特征值向量ks,特征值的代数重数组成的向量kn,
	% 即特征值ks(i)的代数重数kn(i)和几何重数kr(i)
	%
	[v e] = eig(A);
	e = diag(e);
	ne = length(e);
	for i = 1 : ne - 1
		for j = i + 1 : ne
			if (e(i) > e(j))
				temp = e(i);
				e(i) = e(j);
				e(j) = temp;
			end
		end
	end

	e = real(e);
	f = e;
	n = length(A);
	ks = [];
	kn = [];
	kr = [];
	while (~isempty(e))
		c = e(1);
		ks = [ks c];
		s = sum(abs(e - c) < 0.0001);
		F = v(: , find(abs(f -c ) < 0.0001));
		r = rank(F);
		kn = [kn s];
		kr = [kr r];
		e(find(abs(e - c) < 0.0001)) = [];
	end
end



