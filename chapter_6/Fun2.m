
function m=Fun2(n)
	x = n(1);
	y = n(2);
	z = n(3);

	m(1) = sin(x) + y + z^2.*exp(x) - 4;
	m(2) = x + y * z;
	m(3) = x * y * z;
end
