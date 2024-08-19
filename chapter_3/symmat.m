function M=symmat(row, col, f)
%创建符号矩阵,
%symmat(row, col, f)
%参数row col分别为行数与列数
%f 伟矩阵元素的通式
for R=1:row
    for C=1:col
        c=sym(C);
        r=sym(R);
        M(R,C)=subs(sym(f));
    end
end

end