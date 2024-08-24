function [y]=iscline(a, b)
% 判断三向量a,b是否共线
% 共线返回１;
% 不共线返回0
n = length(a);
y = 1;
if (n ~= length(b))
    y = 0;
    return;
end

if (rank([reshape(a, n , 1) reshape(b, n, 1)]) ~= 1)
    y = 0;
    return;
end
end