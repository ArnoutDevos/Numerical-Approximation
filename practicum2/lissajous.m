t = 0:0.01:2*pi+0.1;
A = sin(1*t);
B = sin(2*t)/2;
figure
plot(A,B)
axis equal
print -depsc lissajous.eps;