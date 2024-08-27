
function [pd, pp] = porthl(p, vp, v)
	% 点到直线的对称点以及垂足
	% 点p [3 2 1],  x/1=y/0=z/0 ([0 0 0] [1 0 0]表示直线)
	p = reshape(p, 1, 3);
	vp = reshape(vp, 1, 3);
	v = reshape(v, 1, 3);
	[c, d] = orthprj(p - vp, v);
	pd = vp + c;
	pp = p - 2 *d;
end
