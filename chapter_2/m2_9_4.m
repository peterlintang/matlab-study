

sum = 0;
for i=1:30
    value = 1;
    for j=1:i
        value = value * j;
    end
    sum = sum + value;
end
disp(sum);