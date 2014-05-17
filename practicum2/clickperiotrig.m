[x y] = click();
figure
plot(x,y);
print -depsc infclick.eps;

z = periotrig([x' y'],5,10*length(x));
figure
plot(z(:,1),z(:,2));
print -depsc inftrig.eps;