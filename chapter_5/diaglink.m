
function y = diaglink(A, B)
	% 链接连个Jordan块A, B, 函数返回链接成功后的矩阵
	if (~besquare(A) | ~besquare(B))
		error('The matrix you input is not a Jordan one');
		return ;
	end

	if (isempty(A))
		if (length(B) > 1)
			y = diag(diag(B)) + diag(diag(B, 1), 1);
		else
			y = B;
		end
	elseif (isempty(B))
		if (length(A) > 1)
			y = diag(diag(A)) + diag(diag(A, 1), 1);
		else
			y = A;
		end
	else
		da = diag(A)';
		db = diag(B)';
		da1 = diag(A, 1)';
		db1 = diag(B, 1)';
		if (length(A) == 1)
			da1 = [];
		end
		if (length(B) == 1)
			db1 = [];
		end
		d = [da db];
		d1 = [da1 0 db1];
		c1 = diag(d);
		c2 = diag(d1, 1);
		y = c1 + c2;
	end
end


