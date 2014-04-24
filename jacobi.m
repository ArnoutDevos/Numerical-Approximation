function [ V,D ] = jacobi( A,tol )
V = eye(size(A,1));
D = A;
ready = false;
i=0;
error_off_diagonal = zeros(10,1);
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
        norm_off_diagonal = 0;
        for t=1:size(A,1)
            for u=1:size(A,1)
                if(t~=u)
                    norm_off_diagonal = norm_off_diagonal + abs(D(t,u))^2;
                end
            end
        end
        error_off_diagonal(i) = sqrt(norm_off_diagonal);
        if(error_off_diagonal(i) < tol)
            ready = true;
        end
    end
end

