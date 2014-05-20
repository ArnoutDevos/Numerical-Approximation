n_max = 20;
error_cheby = zeros(n_max,1);
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
yt = interpolate(x,fx,alpha,beta,lambda,t);

error_cheby(n) = max(abs(yt-ft));
end

error_equidist = zeros(n_max,1);
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
yt = interpolate(x,fx,alpha,beta,lambda,t);

error_equidist(n) = max(abs(yt-ft));
end

semilogy(error_equidist,'g');
hold on
semilogy(error_cheby,'bl');
xlim([2 20])
hold off

