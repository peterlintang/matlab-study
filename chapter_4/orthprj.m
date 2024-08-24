
function [c, d] = orthprj(a, b)
	%向量正交投影
	k = dotab(a, b) / (radvec(b) ^ 2);
	c = k * b;
	d = a -c ;
end
