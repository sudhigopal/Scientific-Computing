m=input('Enter the size of the matrix\n');
n=input('Enter the size of the matrix\n');

x = rand(m,n);
a = 1;
b = -1;
for i = 1:m
    for j = 1:n
       H(i,j) = a + (b - a)*x(i,j);
    end
end 

[Q,R] = qr(H,0);
r = zeros(n);
%r(1,1) = norm(H(:,1));
q = H;
for j=1:n
    v = H(:,j);
    %===================================
    %to compute r(i,j)*q(i)
    % H(j) - r(i,j)*q(i)
    %and r(i,j)
    %===================================
    for i = 1 : j-1
        r(i,j) = q(:,i)' * H(:,j);
        v = v - r(i,j)*q(:,i);
    end
    r(j,j) = norm(v);
    q(:,j) = v/r(j,j);
end
Check = q * r;
frob = Frobenius(H,Check,m,n);
%===================================
%Single valued Decomposition(SVD)
%===================================
[U,S,V] = svd(H,0);
svdcheck = 2*(U * (S^1/2) * V');
svdfrob = Frobenius(H,svdcheck,m,n);
%===================================
%to calculate Xls for QR 
%===================================
l = 1;
Randz = rand(m,l);
for i = 1:m
    for j = 1:l
       z(i,j) = a + (b - a)*Randz(i,j);
    end
end
%===================================
%Solving the upper triangle matrix.
%R*x = Q' * Z
%===================================
g = q' * z;
X=zeros(n,1);
X(1)=g(1)/r(1,1);
for i=2:n
    X(i)=-r(i,1)*X(1);
    for k=i:n
        X(i)=X(i)-r(i,k)*X(k);
        X(i)=(g(i)+X(i))/r(i,i);
    end
end
%===================================
%to calculate Xls for SVD 
%===================================
A = V * S * V';
B = V * (S^1/2) * U' * z;
%X = inv(A) * B
SVDXls = A\B;
%===================================
%Equinorm of QR and SV decomposition
%===================================
%for QR
QRHX = H * X;
QRnorm = Enorm(z,QRHX);
%for SVD
SVDHX = H * SVDXls;
SVDnorm = Enorm(z,SVDHX);
if(m<10)
    fprintf('QR decomposition\n');
    fprintf('Matrix H is \n');
    disp(H);
    fprintf('Matrix Q is\n');
    disp(q);
    fprintf('Matrix R is\n');
    disp(r);
    fprintf('Matlab Generated Q R is\n');
    disp(Q);
    disp(R);
    fprintf('Single Valued Decomposition\n');
    fprintf('Matrix U is\n');
    disp(U);
    fprintf('Matrix Delta is\n');
    disp(S);
    fprintf('Matrix V is\n');
    disp(V);
    fprintf('Minimum X for QR is\n');
    disp(X);
    fprintf('Minimum X for SVD is \n');
    disp(SVDXls);
end
fprintf('Frobenius Norm for QR decomposition is');
disp(frob);
fprintf('Frobenius Norm for SVD is');
disp(svdfrob);
fprintf('Equinorm of QR decomposition is\n');
disp(QRnorm);
fprintf('Equinorm of SVD decomposition is \n');
disp(SVDnorm);
