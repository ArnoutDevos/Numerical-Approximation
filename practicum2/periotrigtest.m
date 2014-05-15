N = 512;

t1 = 0:2*pi/(N-1):2*pi;
c = zeros(1,length(t1),1);
for k = 1:10
    c = c + cos(k*t1);
end

M = 1024;
K = 20;

t2 = 0:2*pi/(M-1):2*pi;
y = periotrig2(c',K,M);

figure(1)
hold on
plot(t1,c,'b');
plot(t2,y,'r');
title('Ingevoerde en benaderende functie')

figure(2)
hold on
plot(abs(fft(c)),'b');
plot(abs(fft(y)),'r');
title('FFTs van ingevoerde en benaderende functie')