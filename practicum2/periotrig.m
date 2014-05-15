function y = periotrig(x,K,M)
%periotrig Summary of this function goes here
%   Detailed explanation goes here
X   = fft(x);
%t   = 0:1/M:(M-1);
N   = size(x,1);
X(N/2,:)=X(N/2,:)/2;
    for m=0:(M-1)% voor ieder punt in t
        y(m+1,:) = X(1,:); % y = Y0
        
        for k=2:(K-1)
            y(m+1,:) = y(m+1,:) + 2*(X(k,:).*cos(2*pi*k*m/M)+1i*X(k,:).*sin(2*pi*k*m/M));
        end

        if K == N/2
            y(m+1,:) = y(m+1,:) + X(K,:)*cos(2*pi*K*m/M);
        end
    end
    y = y./N;
end