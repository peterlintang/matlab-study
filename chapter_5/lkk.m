
function [cc, y] = lkk(A, k, v)
	%函数生成矩阵A关于特征值k的所有Jordan块并加以链接，
	%同时返回特征值k的特征向量和广义特征向量构成的矩阵cc
	% y:k的jordan块链接而成的矩阵,特征向量
	% cc:广义特征向量构成的矩阵cc
	% k:特征值
	% v:矩阵A的特征值k的jordan块的说明向量
	% A:矩阵
	n = length(v);
	AA = A - k * eye(length(A));
	D = null(AA);
	kk = 1;
	cc = [];
	y = [];
	for i = 1 : n
		for j = 1 : v(i)
			cc = [cc D(: , kk)];
			b = D(:, kk);
			for l = 2 : i
				x = pinv(AA) * b;
				cc = [cc x];
				b = x;
			end
			kk = kk + 1;
			c = lk(k, i);
			y = diaglink(y, c);
		end
	end
end

