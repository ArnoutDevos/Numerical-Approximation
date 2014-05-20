n_max = 10;
t = (-1:0.001:1)';
plot(t,1./(1+6*t.^2),'r');
hold on;

for n=2:n_max
% Compute the interpolation points (Chebyshev)
x = linspace(-1,1,n)';

%compute the matrix M which contains the evaluated polynomials
alpha = zeros(n-1,1);
lambda = 2*ones(n-1+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n-1,1);

%evaluate the approximation polynomial in the following points


%evaluate the function to approximate in the interpolation points
fx = 1./(1+6*x.^2);

%calculate the function values of the evaluated points
yt = interpolate(x,fx,alpha,beta,lambda,t);
yx = interpolate(x,fx,alpha,beta,lambda,x);

% plot some characteristics
plot(t,yt,'Color',color2(n,:));
pause
end
hold off

