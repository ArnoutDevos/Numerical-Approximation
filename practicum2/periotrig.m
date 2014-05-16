function y = periotrig(x,K,M)
%periotrig Summary of this function goes here
%   Detailed explanation goes here
Y   = fft(x);
%t   = 0:1/M:(M-1);
[N d]   = size(x);

% Coefficienten verwijderen adhv K
% Y_k = 0 for k = K+1,...,N/2 if K < N/2
Y(K+2:N-K)=0;
size(Y,1)

% Y_k = X_k*M/N for k = 0,...,N/2-1
Y(1:N/2,:) = Y(1:N/2,:)*M/N;
% Y_k = X_k*M/(N*2) for k = N/2
Y(N/2+1,:)=Y(N/2+1,:)*M/(N*2);
% Y_k = 0 for k = N/2+1,... ,M/2
Y(N/2+2:M/2+1,:)=0;
%Y = [Y; zeros()];
Y = Y(1:M/2+1,:);
size(Y,1)

% steunend op symmetrie
%Y(M/2+1:M-1,:) = conj(Y(M/2:2,:));

for k = M/2+1:M-1
    Y = [Y; conj(Y(M-k+1,:))];
end
size(Y,1)
% for k = M/2+2:M %Y_k = Y_(M-k) for k = M/2+1,...,M-1
%     Y = [Y; conj(Y(M-k+1,:))];
% end
y = ifft(Y,M);
end