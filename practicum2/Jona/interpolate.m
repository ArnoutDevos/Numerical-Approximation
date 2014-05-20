function [y,M] = interpolate(x,f,alpha,beta,lambda,t)
% interpolate functie berekent de waarden van de interpolerende veelterm in
% elementen van t door middel van het rekenschema van smith
%   x = kolom vector van lengte n die de interpolatiepunten bevat
%   f = kolom vector van lengte n die de waarden van de functie in x bevat
%   alpha = kolom vector van lengte n e.g. [a1 a2 a3]
%   beta = kolom vector van lengte n e.g. [b1 b2 b3]
%   lambda = kolom vector van lengte n+1 e.g. [l0 l1 l2 l3]
%   t = kolom vector die de waarden bevat waarin de interpolerende veelterm
%       geëvalueerd moet worden
%   y = waarden van de interpolerende veelterm in t
n = length(x);
M = eval_recursion(x,n,alpha,beta,lambda);
% los het stelsel op om de coëfficiënten te bepalen
c = M\f;
% bereken voor elke waarde van de vector t de waarde van de interpolerende
% veelterm van graad m door middel van het rekenschema van smith
% B bevat op kolom k alle coëfficiënten b die horen bij een enkele waarde
% van de vector t
m = n-1;
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
end

