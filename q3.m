%Sudhindra Gopal Krishna

%Question 3
[x1,x2]= meshgrid(-6:.1:6,-6:.1:6);
fx1 = 0.5*x1.^2 + x2.^2;
figure
contour(x1,x2,fx1)

fx2 = x1.^2 + x2.^2;
figure
contour(x1,x2,fx2)

fx3 = 1.5*x1.^2 + x2.^2;
figure
contour(x1,x2,fx3)

fx4 = 2*x1.^2 + x2.^2;
figure
contour(x1,x2,fx4)

%Question 4

[x1,x2]= meshgrid(-6:.1:6,-6:.1:6);
fx1 = 0.5*x1.^2 + x2.^2+ x1 + x2;
figure
contour(x1,x2,fx1)

fx2 = x1.^2 + x2.^2 + x1 + x2;
figure
contour(x1,x2,fx2)

fx3 = 1.5*x1.^2 + x2.^2 + x1 + x2;
figure
contour(x1,x2,fx3)

fx4 = 2*x1.^2 + x2.^2 +x1 + x2;
figure
contour(x1,x2,fx4)

%Question 5
%Eigen Values and Eigen Vector 
A = [1 -1;-1 2];
[Eigenvect,EigenVal] = eig(A);
disp('Eigen Vectors');
disp(Eigenvect);
disp('Eigen Values');
disp(Eigenval);