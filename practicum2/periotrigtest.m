N = 256;

t1 = 0:1/(N-1):1;
c = zeros(1:length(t1),1);
for k = 1:20
    c = c + sin(k*t1'*2*pi);
end

M = 256;
K = 21;

t2 = 0:1/(M-1):1;
y = periotrig(c,K,M);

figure(1)
subplot(3,1,1)
hold on
plot(t1,c(:,1),'b');
plot(t2,y(:,1),'r');
title('Ingevoerde en benaderende functie')

subplot(3,1,2)
plot(abs(fft(c)),'b');
subplot(3,1,3)
plot(abs(fft(y)),'r');
title('FFTs van ingevoerde en benaderende functie')