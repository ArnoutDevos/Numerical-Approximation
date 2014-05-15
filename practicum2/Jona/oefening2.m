oefening1
n = 200;
alpha = zeros(n,1);
lambda = 2*ones(n,1);
lambda(1) = 1;
beta = ones(n,1);
M = eval_recursion_jona(x,n,alpha,beta,lambda);
set(0,'DefaultAxesColorOrder',[1 0 0;0 1 0;0 0 1]);
for j = 3:5
    scatter(x,M(:,j));
    hold all;
end
hold off;