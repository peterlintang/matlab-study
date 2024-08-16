
%计算pi的值，根据这个公式
sum = 0.0;
for i=1:1:100000
    sum = sum + (-1)^(i - 1)/(1 + 2 * (i - 1));
    %disp(i);
    %disp(sum);
end
disp(sum * 4);
