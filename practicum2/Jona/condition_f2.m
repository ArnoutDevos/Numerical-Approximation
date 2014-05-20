n_max = 20;
figure;
condition_cheby = zeros(n_max,1);
for n=2:n_max
%Compute the interpolation points (Chebyshev)
alpha = zeros(n,1);
lambda = 2*ones(n+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n,1);
x = poly_zeros(n,alpha,beta,lambda);


%compute the matrix M which contains the evaluated polynomials
alpha = zeros(n-1,1);
lambda = 2*ones(n-1+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n-1,1);

%evaluate the approximation polynomial in the following points
t = (-1:0.01:1)';

%evaluate the function to approximate in the interpolation points
ft = 1./(1+6*t.^2);
fx = 1./(1+6*x.^2);

%calculate the function values of the evaluated points
[yt,M1] = interpolate(x,fx,alpha,beta,lambda,t);

condition_cheby(n) = cond(M1);
end

condition_equidist = zeros(n_max,1);
for n=2:n_max
%Compute the interpolation points (Chebyshev)
x = linspace(-1,1,n)';

%compute the matrix M which contains the evaluated polynomials
alpha = zeros(n-1,1);
lambda = 2*ones(n-1+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n-1,1);

%evaluate the approximation polynomial in the following points
t = (-1:0.01:1)';

%evaluate the function to approximate in the interpolation points
ft = 1./(1+6*t.^2);
fx = 1./(1+6*x.^2);

%calculate the function values of the evaluated points
[yt,M2] = interpolate(x,fx,alpha,beta,lambda,t);

condition_equidist(n) = cond(M2);
end

semilogy(condition_equidist,'m');
hold on
semilogy(condition_cheby,'r');
xlim([2 20])
hold off

