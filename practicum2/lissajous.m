t = 0:0.01:2*pi+0.1;
A = sin(1*t);
B = sin(2*t);
figure
plot(A,B)
print -depsc lissajous.eps;