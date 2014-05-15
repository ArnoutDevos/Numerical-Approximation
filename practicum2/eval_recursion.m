function M = eval_recursion(x, n, alpha, beta, lambda)
%eval_recursion
%   This function evaluates the three-term recurrence 
%   relation for orthogonal polynomials.
%   x       = column vector of points where the function is evaluated
%   n       = number of orthogonal polynomials to be used
%   alpha   = column vector of length equal to n e.g. [a1 a2 a3]
%   beta    = column vector of length equal to n e.g. [b1 b2 b3]
%   lambda  = column vector of length equal to n + 1 e.g. [b0 b1 b2 b3]
    if(n == 1)
        M(1:length(x),1) = lambda(1);
        M(1:length(x),2) = (x-alpha(1))*lambda(2)*lambda(1);
    else
        L = eval_recursion(x, n-1, alpha, beta, lambda);
        M = [L ((lambda(n+1)*L(:,n)).*(x-alpha(n))-beta(n)*L(:,n-1))];
    end
end