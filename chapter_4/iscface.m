function [y] = iscface(a, b, c)
%判断三维向量abc是否共面
% 1 是; 0 否

n = length(a);
y = 1;

if (n ~= length(b) & n ~= length(c))
    y = 0;
    return ;
end

if (rank([reshape(a, n, 1) reshape(b, n, 1) reshape(c, n, 1)]) == 3)
    y = 0;
    return;
end

end