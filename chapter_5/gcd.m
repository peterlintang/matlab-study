
function y = gcd(f, g)
	% 求多项式f,g的最大公因式
	%
	%
	while ~isempty(f)
		if abs(f(1)) < 2 * eps
			f(1) = [];
		else
			break;
		end
	end

	while ~isempty(g)
		if abs(g(1)) < 2 * eps
			g(1) = [];
		else
			break;
		end
	end
	if isempty(f) | isempty(g)
		error('arguments should not be null');
		return;
	end

	f = f / f(1);
	g = g / g(1);

	while 1
		[q, r] = deconv(f, g);
		while ~isempty(r)
			if abs(r(1)) < 2 * eps
				r(1) = [];
			else
				break;
			end
		end
		if isempty(r)
			y = g / g(1);
			return ;
		else
			f = g;
			g = r;
		end
		if length(r) == 1	% 是等号还是？？
			y = 1;
			return;
		end
	end
end



