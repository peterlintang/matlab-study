%m2_9_7
function [out] = legendre_polynomial(n, x) %codegen
    if (n == 0)
        out = 1;
    elseif (n == 1)
        out = x;
    else
        out = (2*n - 1)*x*legendre_polynomial((n - 1), x) - (n-1)*legendre_polynomial((n-2),x) / n;
        %out = (2*n-1)*x*legendre_polynomial((n-1),x)-(n-1)*legendre_polynomial((n-2),x)/n;
    end
end