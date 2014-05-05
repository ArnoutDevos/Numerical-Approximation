function [B,R] = opgave1A(A,k)
Q=eye(size(A));
A=inv(A);
for i=1:k
    Z=A*Q;
    [Q,R] = qr(Z);
end
B = 1./(diag(R));