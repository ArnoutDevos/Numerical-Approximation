[x y] = click();
figure
hold on
axis([0 1 0 1]);
plot(x,y,'bx-');
%print -depsc infclick.eps;
hold off

z = periotrig([x' y'],2,100*length(x));
figure
hold on
axis([0 1 0 1]);
plot(z(:,1),z(:,2));
%print -depsc inftrig.eps;