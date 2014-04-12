function [ V,D ] = opgave_9( A,tol )
V = eye(size(A,1));
D = A;
s = sort(eig(A),'descend');
ready = false;
i=0;
while ~ready
    i = i + 1;
    for p=1:(size(A,1)-1)
        for q = (p+1):size(A,1)
            theta = (1/2)*atan(2*D(p,q)/(D(q,q)-D(p,p)));
            J = eye(size(A,1));
            J(p,p) = cos(theta);
            J(p,q) = sin(theta);
            J(q,p) = -sin(theta);
            J(q,q) = cos(theta);
            D = J'*D*J;
            V = V * J;
        end
    end
    d = sort(diag(D),'descend');
    residu = max(abs(d-s))
    if(residu < tol)
        ready = true;
    end
end
steps = i


end

