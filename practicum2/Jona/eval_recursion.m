function M = eval_recursion(x,n,alpha,beta,lambda)
% eval_recursion functie evalueert de veeltermen gekarakteriseerd door
% alpha, beta en lambda in de opgegeven punten van x
%   x = kolom vector van lengte n die de waarden waarin geëvalueerd moet worden
%       bevat
%   n = aantal punten waarin geëvalueerd moet worden
%   alpha = kolom vector van lengte n e.g. [a1 a2 a3]
%   beta = kolom vector van lengte n e.g. [b1 b2 b3]
%   lambda = kolom vector van lengte n+1 e.g. [l0 l1 l2 l3]
%   M = vierkante matrix van dimensie n die de geëvalueerde punten bevat

M = zeros(n,n);
M(:,1) = lambda(1);
lambda = lambda(2:n);
% De evaluatie van de veeltermen gebeurt ahv de drietermsrecursiebetrekking 
for i = 1:n
    M(i,2) = x(i);
    for j = 3:n;
        M(i,j) = lambda(j-1)*(x(i)-alpha(j-1))*M(i,j-1)-beta(j-1)*M(i,j-2);
    end
end
end

