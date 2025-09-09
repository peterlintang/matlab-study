function [center, scale_axis] = fit_elliposoid9(data)
% input data is n * 3, n points of the ellipsoid surface
% Least square method
% a(1)x^2+a(2)y^2+a(3)z^2+a(4)xy+a(5)xz+a(6)yz+a(7)x+a(8)y+a(9)z=1
% output center is 1 * 3, center of elliposoid,
% scale_axis is 1 * 3, 3 axis's scale
% author not me

mean_x = mean(data(:,1));
mean_y = mean(data(:,2));
mean_z = mean(data(:,3));

x = data(:,1) - mean_x;
y = data(:,2) - mean_y;
z = data(:,3) - mean_z;

D = [x.*x y.*y z.*z x.*y x.*z y.*z x y z];
a = inv(D'*D)*D'*ones(size(x));
M = [a(1)  a(4) / 2  a(5) / 2;  ...
	 a(4) / 2  a(2)   a(6) / 2;  ...
	 a(5) / 2  a(6) / 2   a(3)];
center = -1 / 2 * [a(7), a(8), a(9)] * inv(M);
SS = center * M * center' + 1;
[U, V] = eig(M);
[~, n1] = max(abs(U(:,1)));
[~, n2] = max(abs(U(:,2)));
[~, n3] = max(abs(U(:,3)));
lambda(n1) = V(1,1);
lambda(n2) = V(2,2);
lambda(n3) = V(3,3);
scale_axis = [sqrt(SS/lambda(1)), sqrt(SS/lambda(2)), sqrt(SS/lambda(3))];
center = round(center + [mean_x, mean_y, mean_z]);
scale_axis = round(scale_axis);

figure
plot3(data(:,1), data(:,2), data(:,3), 'b.', center(1), center(2), center(3), 'ro');
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
end