
function y = lk(k, n)
	%生成特征值k的n阶Jordan块, n为整数且大于0.
	% k特征值
	% n阶
	n = fix(n);
	if (n < 1)
		error('the argument n should be great than 0');
		return ;
	end
	if (n == 1)
		y = k;
	elseif (n > 1)
		c = diag(ones(1, (n - 1)), 1);
		d = k * eye(n);
		y = c + d;
	end
end
