
function y = lcd(f, g)
	% 求最小公倍式
	%
	r = gcd(f, g);
	y = deconv(conv(f, g), r);
end
