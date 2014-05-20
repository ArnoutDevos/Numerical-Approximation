n = 3;
alpha = zeros(n,1);
lambda = 2*ones(n+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n,1);
x = poly_zeros_jona(n,alpha,beta,lambda);
M = eval_recursion_jona(x,n,alpha,beta,lambda);
f = cos(x);
c = M\f;

%We hebben n interpolatiepunten en dus een veelterm van graad n-1.
t = (-1:0.01:1)';
alpha = zeros(n-1,1);
lambda = 2*ones(n-1+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n-1,1);


% y = zeros(length(t),1);
% for i = 1:length(t)
y = smith_jona_norec(c,n-1,t,alpha,beta,lambda);
plot(t,cos(t),'g');
hold on
plot(t,y,'r');
hold off