function y = periotrig(x,K,M)
%periotrig Functie voor het evalueren van periodieke interpolerende en 
%   benaderende trigonometrische veeltermen
Y   = fft(x);
%t   = 0:1/M:(M-1);
[N d]   = size(x);

% Coefficienten verwijderen aan de hand van K
% Y_k = 0 for k = K+1,...,N/2 if K < N/2
Y(K+2:N-K)=0;

% Y_k = X_k*M/N for k = 0,...,N/2-1
Y(1:N/2,:) = Y(1:N/2,:)*M/N;
% Y_k = X_k*M/(N*2) for k = N/2
Y(N/2+1,:)=Y(N/2+1,:)*M/(N*2);
% Y_k = 0 for k = N/2+1,... ,M/2
Y(N/2+2:M/2+1,:)=0;
% Alleen de nodige coefficienten overhouden
Y = Y(1:M/2+1,:);

% Steunen op de symmetrie
%Y(M/2+1:M-1,:) = conj(Y(M/2:2,:));

for k = M/2+1:M-1
    Y = [Y; conj(Y(M-k+1,:))];
end
y = ifft(Y,M);
end