function x = poly_zeros(n, alpha, beta, lambda)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A = diag(alpha,0);

v = beta(2:n)./lambda(2:n)
A = A + diag(v,1);

mu = 1./lambda;
A = A + diag(mu(1:n-1),-1);

x = eig(A);
end