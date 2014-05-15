function [ b ] = smith_jona(c,l,n,x, alpha, beta, lambda )
if l == 0
    b = (c(l+1)+lambda(l+2)*(x-alpha(l+2))*smith_jona(c,l+1,n,x,alpha,beta,lambda)-beta(l+3)*smith_jona(c,l+2,n,x,alpha,beta,lambda))*lambda(l+1);
elseif l == n-1
    b = c(l+1);
elseif l == n-2
    b = c(l+1)+lambda(l+2)*(x-alpha(l+2))*smith_jona(c,l+1,n,x,alpha,beta,lambda);
else
    b = c(l+1)+lambda(l+2)*(x-alpha(l+2))*smith_jona(c,l+1,n,x,alpha,beta,lambda)-beta(l+3)*smith_jona(c,l+2,n,x,alpha,beta,lambda);
end


