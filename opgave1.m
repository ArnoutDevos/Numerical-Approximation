function [B] = opgave1(A,k)
Q=eye(size(A));
for i=1:k
    Z=A\Q;
    [Q,R] = qr(Z);
end
B = Q'*A*Q;