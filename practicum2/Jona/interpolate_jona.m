function [y,M] = interpolate_jona(x,f,alpha,beta,lambda,t)
n = length(x);
M = eval_recursion_jona(x,n,alpha,beta,lambda);
cond(M)
c = M\f;
y = zeros(length(t),1);
for i = 1:length(t)
y(i) = smith_jona_norec(c,n-1,t(i),alpha,beta,lambda);
end

end

