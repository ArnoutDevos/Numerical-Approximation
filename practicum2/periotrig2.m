function y = periotrig2(x,K,M)
%periotrig Summary of this function goes here
%   Detailed explanation goes here
Y   = fft(x);
%t   = 0:1/M:(M-1);
[N d]   = size(x);

% Y_(K+1) .. Y_(N/2+1) = 0
Y(K+1:N/2)=0;

% k = 0,... ,N/2-1
Y(1:N/2,:) = Y(1:N/2,:)*M/N;

% k = N/2
Y(N/2+1,:)=Y(N/2+1,:)/2;

% k = N/2+1,... ,M/2
Y(N/2+2:M/2+1,:)=0;

% steunend op symmetrie
%Y(M/2+1:M-1,:) = conj(Y(M/2:2,:));

for k = M/2+1:M-1
    Y = [Y; conj(Y(M-k+1,:))];
end

y = ifft(Y);
end