function [ b ] = smith_jona(c, l,n,x, alpha, beta, lambda )
if l == 0
    b = smith_jona(c,l+1,n,x,alpha,beta,lambda)*lambda(l+1);
elseif l == n
    b = c(l);
elseif l == n-1
    b = c(l)+lambda(l+1)*(x-alpha(l+1))*beta(l+1);
else
    b = c(l)+ smith_jona(c,l+1,n,x,alpha,beta,lambda)*lambda(l+1)*(x-alpha(l+1))-smith_jona(c,l+2,n,x,alpha,beta,lambda)*beta(l+2);
end


