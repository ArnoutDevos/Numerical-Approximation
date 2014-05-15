n_max = 20;
condition = zeros(n_max,1);
for n=2:n_max
%Compute the interpolation points (Chebyshev)
alpha = zeros(n,1);
lambda = 2*ones(n+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n,1);
x = poly_zeros_jona(n,alpha,beta,lambda);


%compute the matrix M which contains the evaluated polynomials
alpha = zeros(n-1,1);
lambda = 2*ones(n-1+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n-1,1);

%evaluate the approximation polynomial in the following points
t = (-1:0.01:1)';

%evaluate the function to approximate in the interpolation points
% f = cos(x);
fx = 1./(1+6*x.^2);
ft = 1./(1+6*t.^2);

%calculate the function values of the evaluated points
[yt,Mt] = interpolate_jona(x,fx,alpha,beta,lambda,t);
yx = interpolate_jona(x,fx,alpha,beta,lambda,x);

condition(n) = cond(Mt);
end
hold on
semilogy(condition,'bl');