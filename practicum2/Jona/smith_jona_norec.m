function [ y ] = smith_jona_norec(c,m,x, alpha, beta, lambda)
y = lambda(1);
lambda = lambda(2:m+1);
b = zeros(m+1,1);
b(m+1) = c(m+1);
b(m) = c(m)+lambda(m)*(x-alpha(m))*b(m+1);
for i = (m-1):-1:1
    b(i) = c(i)+lambda(i)*(x-alpha(i))*b(i+1)-beta(i+1)*b(i+2);
end
y = b(1)*y;
end

