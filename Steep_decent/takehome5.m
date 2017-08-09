syms x y
[x,y]=meshgrid(-5:.1:5,-5:.1:5);
f = (1/3)*x.^3 + (1/2)*x.^2 + 2*x.*y + (1/2)*y.^2-y+9;
figure
contour(x,y,f,'showtext','on')
grid on
title('Contour plot for f(x)');

A = [5 2
    2 1];
B = [3 2
    2 1];
eig_valA = eig(A);
fprintf('Eigen values of Xa = 2 and Xb = -3\n');
disp(eig_valA);
eig_valB = eig(B);
fprintf('Eigen values of Xa = 1 and Xb = -1\n');
disp(eig_valB);