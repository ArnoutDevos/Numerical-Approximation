function M = eval_recursion_jona(x,n,alpha,beta,lambda)
%compute the matrix M which contains the evaluated polynomials

M = zeros(n,n);
M(:,1) = lambda(1);
lambda = lambda(2:n);
for i = 1:n
    M(i,2) = x(i);
    for j = 3:n;
        M(i,j) = lambda(j-1)*(x(i)-alpha(j-1))*M(i,j-1)-beta(j-1)*M(i,j-2);
    end
end
end

