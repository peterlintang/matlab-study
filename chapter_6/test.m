
x = 0:3^.5/50:3^.5;
y = 0:2/50:2;
z = 0;
for i = 1 : 51
	for j = 1 : 51
		z(j, i) = ((1 - (x(i)^2/3 + y(j)^2/4))*5)^.5;
		if imag(z(j, i)) < 0
			z(j, i) = nan;
		end
		if imag(z(j, i)) > 0
			z(j, i) = nan;
		end
	end
end
mesh(x, y, z);
hold on
mesh(x, y, -z);

mesh(x, -y, z);
mesh(x, -y, -z);
mesh(-x, y, z);
mesh(-x, y, -z);
mesh(-x, -y, -z);
mesh(-x, -y, z);

