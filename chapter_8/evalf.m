
function y=evalf(f, x)
	%x输入参数
	%f字符串表示的函数
	f = deblank(f);
	ff = [f '(' num2str(x) ')'];
	y = eval(ff);
end
