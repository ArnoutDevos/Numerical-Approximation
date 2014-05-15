n_max = 20;
error = zeros(n_max,1);
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
t = (-1:0.01:1)';

%evaluate the function to approximate in the interpolation points
% f = cos(x);
fx = 1./(1+6*x.^2);
ft = 1./(1+6*t.^2);

%calculate the function values of the evaluated points
yt = interpolate_jona(x,fx,alpha,beta,lambda,t);
yx = interpolate_jona(x,fx,alpha,beta,lambda,x);

% % plot some characteristics
% subplot(1,2,1);
% % plot(t,cos(t),'g');
% plot(t,1./(1+6*t.^2),'g');
% hold on
% plot(t,yt,'r');
% scatter(x,yx,'o');
% hold off
% 
% subplot(1,2,2);
% % semilogy(t,abs(yt-cos(t)),'bl');
% semilogy(t,abs(yt-ft),'bl');
% hold on
% % scatter(x,abs(yx-cos(x)),'o');
% scatter(x,abs(yx-fx),'o');
% hold off
% pause
error(n) = max(abs(yt-ft));
end
plot(error,'g');

