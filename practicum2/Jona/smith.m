function y = smith_jona_norec(c,m,t, alpha, beta, lambda)
% smith functie evalueert de interpolerende veelterm van graad m in de
% waarde x door middel van het rekenschema van Smith
%   c = kolomvector van lengte m+1 die de coëfficiënten van de
%       basisfuncties bevat
%   m = graad van de interpolerende veelterm
%   x = waarde waarin interpolerende veelterm geëvalueerd moet worden
%   alpha = kolom vector van lengte m e.g. [a1 a2 a3]
%   beta = kolom vector van lengte m e.g. [b1 b2 b3]
%   lambda = kolom vector van lengte m+1 e.g. [l0 l1 l2 l3]
%   y = de waarde van de interpolerende veelterm in x 
y = zeros(length(t),1);
lambda = lambda(2:m+1);
B = zeros(m+1,length(t));
for k = 1:length(t)
y(k) = lambda(1);
B(m+1,k) = c(m+1);
B(m,k) = c(m)+lambda(m)*(t(k)-alpha(m))*B(m+1,k);
for i = (m-1):-1:1
    B(i,k) = c(i)+lambda(i)*(t(k)-alpha(i))*B(i+1,k)-beta(i+1)*B(i+2,k);
end
y(k) = B(1,k)*y(k);
end

