function [M,y,c] = interpolate_jona(x,f,n,alpha,beta,lambda,t)
M = eval_recursion_jona(x,n,alpha,beta,lambda);
c = M\f;
y = zeros(length(t),1);
for i = 1:length(t)
y(i) = smith_jona(c,0,n,t(i),alpha,beta,lambda);
end

end

