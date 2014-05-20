n_max = 4;
t = (-1:0.001:1)';
plot(t,cos(t),'g');
hold on;
cmap = rand(n_max, 3);

for n=2:n_max
% Compute the interpolation points (Chebyshev)
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


%evaluate the function to approximate in the interpolation points
fx = cos(x);

%calculate the function values of the evaluated points
yt = interpolate(x,fx,alpha,beta,lambda,t);
yx = interpolate(x,fx,alpha,beta,lambda,x);

% plot some characteristics
plot(t,yt,'Color',color(n,:));
pause
end
hold off

