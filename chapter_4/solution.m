function [C] =solution(A)
% 求矩阵的零空间, 所求解含最多的零元素个数
% 齐次线性方程组
[l, u] = lu(A);

M1=[]; M2=[]; e = []; f = []; c = [];
C=[];

r = rank(A);
rf = size(A);
n = rf(1, 2);
k = 1;
for i = 1:r
    while (k <= n)
        if (u(i, k) ~= 0)
            e = [e k];
            M1 = [M1 u(1:r, k)];
            k = k + 1;
            break;
        else
            f = [f k];
            M2 = [M2 -u(1:r, k)];
        end
        k = k + 1;
    end
end

M2 = [M2 -u(1:r, k:n)];
f = [f k:n];
for i = 1 : (n - r)
    y =zeros((n - r), 1);
    y(i) = 1;
    x = M1\(M2 * y);
    c = zeros(n, 1);
    for j = 1 : r
        c(e(j)) = x(j);
    end
    for j = 1 : (n - r)
        c(f(j)) = y(j);
    end
    C = [C c];
end
end