N = 512;

t1 = 0:1/(N-1):1;
c = zeros(1:length(t1),1);
freq = 10
for k = 1:freq
    c = c + sin(k*t1'*2*pi);
end

M = 512;
K1 = 256;
K2 = 10;
K3 = 5;

t2 = 0:1/(M-1):1;
y1 = periotrig(c,K1,M);

 gcf = figure(1);
x0=10;y0=10;width=1000;height=200;
set(gcf,'paperunits','points','paperposition',[x0,y0,width,height])
subplot(1,2,1)
 plot(t1,c(:,1),'b');
subplot(1,2,2)
fftje = abs(fft(c));
 plot(0:2*freq-1,fftje(1:2*freq),'b');
 print -depsc periotriga.eps;
 
y2 = periotrig(c,K2,M);

 gcf = figure(2);
x0=10;y0=10;width=1000;height=200;
set(gcf,'paperunits','points','paperposition',[x0,y0,width,height])
subplot(1,2,1)
hold on
 plot(t2,y1(:,1),'b');
 plot(t2,y2(:,1),'r');
 hold off
subplot(1,2,2)
hold on
 fftje = abs(fft(y1));
 plot(0:2*freq-1,fftje(1:2*freq),'b');
 fftje = abs(fft(y2));
 plot(0:2*freq-1,fftje(1:2*freq),'r');
hold off
 print -depsc periotrigb.eps;

 
y3 = periotrig(c,K3,M);

 gcf = figure(3);
x0=10;y0=10;width=1000;height=200;
set(gcf,'paperunits','points','paperposition',[x0,y0,width,height])
subplot(1,2,1)
hold on
 plot(t2,y1(:,1),'b');
 plot(t2,y3(:,1),'r');
 hold off
subplot(1,2,2)
hold on
 fftje = abs(fft(y1));
 plot(0:2*freq-1,fftje(1:2*freq),'b');
 fftje = abs(fft(y3));
 plot(0:2*freq-1,fftje(1:2*freq),'r');
hold off
 print -depsc periotrigc.eps;
 