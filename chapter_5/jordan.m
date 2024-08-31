
function [p, y] = jordan(A)
	% 生成特征值的jordan块的说明向量v
	% p: 矩阵A转化为jordan标准形的可逆过渡矩阵,
	% y: A的jordan标准型
	% 计算得到的数据与例子有出入???
	if ~issquare(A)
		error('The matrix must be square');
		return;
	end
	
	y = [];
	n = length(A);
	p = [];
	if n == 0
		error(' the matrix should not be empty');
		return;
	end
	if n == 1
		p = 1;
		y = A;
		return ;
	end
	y = [];
	n = length(A);
	p = [];
	[ks kn kr] = cc(A);
	for i = 1 : length(ks)
		v = [];
		if kn(i) == 1
			v(1) = 1;
		elseif kr(i) == 1
			v(kn(i)) = 1;
		elseif kn(i) == kr(i)
			v(1) = kn(i);
		else
			v(1) = 0;
			RA = A - ks(i) * eye(n);
			j = 2;
			while 1
				v(j) = rank(RA^(j - 1)) + rank(RA^(j + 1)) - 2 * rank(RA^j);
				ss = 0;
				rr = 0;
				for ii = 2 : j
					ss = ss + ii * v(ii);
					rr = rr + v(ii);
				end
				aa = kn(i) - ss;
				if aa == (kr(i) - rr)
					v(1) = aa;
					break;
				end
				j = j + 1;
			end
		end
		[cc AA] = lkk(A, ks(i), v);
		p = [p cc];
		y = diaglink(y, AA);
	end
end
















