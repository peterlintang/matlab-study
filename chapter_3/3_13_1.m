
% use plot
x=-4:0.01:4;
y= x.^2.*sin(x);
plot(x,y);

% use fplot
fplot(@(x) x.^2.*sin(x), [-4, 4])

% use ezplot
ezplot('x.^2.*sin(x)', [-4, 4]);
