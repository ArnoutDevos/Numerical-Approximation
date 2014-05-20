function [x] = poly_zeros(n,alpha,beta,lambda)
% poly_zeros functie berekent de nulpunten van een orthogonale veelterm
% gebaseerd op de waarden alpha, beta en lambda uit de recursiebetrekking
%   n = de graad van de veelterm waarvan we de nulpunten zoeken
%   alpha = kolom vector van lengte n e.g. [a1 a2 a3]
%   beta = kolom vector van lengte n e.g. [b1 b2 b3]
%   lambda = kolom vector van lengte n+1 e.g. [l0 l1 l2 l3]
%   x = kolom vector van lengte n die de nulpunten van de veelterm bevat

% elementen van alpha op de diagonaal van A plaatsen
A = diag(alpha,0);
mu = 1./lambda(2:n+1);
nu = beta./lambda(2:n+1);
% elementen van mu en nu op respectievelijk de 1e en -1e diagonaal van A 
% plaatsen
A = A + diag(mu(1:n-1),1) + diag(nu(2:n),-1);
% de eigenwaarden van de matrix A leveren de nulpunten van de veelterm
x = eig(A);
end

