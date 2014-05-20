oefening1
n = 2000;
alpha = zeros(n,1);
lambda = 2*ones(n+1,1);
lambda(1) = 1;
lambda(2) = 1;
beta = ones(n,1);
M = eval_recursion(x,n,alpha,beta,lambda);
set(0,'DefaultAxesColorOrder',[0 1 1;1 0 0;0 0 1;0 1 0;1 0 1]);
for j = 2:5
    plot(x,M(:,j));
    hold all;
end
hold off;