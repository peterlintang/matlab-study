
function y=dsolves(A)
	syms t real;
	d = eig(A);
	[v,n] = eig(A);
	y = exp(d*t)'*v;
end

