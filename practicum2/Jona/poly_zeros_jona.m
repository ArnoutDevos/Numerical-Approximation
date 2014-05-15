function [x] = poly_zeros_jona(n,alpha,beta,lambda)
A = zeros(n,n);
mu = 1./lambda(2:n+1);
nu = beta./lambda(2:n+1);
nu = nu(2:n);
A(1,1) = alpha(1);
A(1,2) = mu(1);
for i = 2:n-1
    A(i,i) = alpha(i);
    A(i,i-1) = nu(i-1);
    A(i,i+1) = mu(i);
end
A(n,n-1) = nu(n-1);
A(n,n) = alpha(n);

x = eig(A);
end

