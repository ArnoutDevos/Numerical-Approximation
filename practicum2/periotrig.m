function y = periotrig(x,K,M)
%periotrig Summary of this function goes here
%   Detailed explanation goes here
X   = fft(x);
t   = 0:1/M:(M-1);
y   = X;% y = Y0

bound = min(size(x,1),2*K)/2;
X(bound:end,:)=0;


for k=1:K
    y = y + 2*(X(k,:).*cos(2*pi*k*t)+i*X(k,:).*sin(2*pi*k*t));
end

end