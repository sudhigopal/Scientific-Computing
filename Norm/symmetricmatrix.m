%Sudhindra Gopal Krishna
%113359296
%Scientific Computing Assg5
%Main Function
n=input('Enter the size of the matrix\n');
%for square matrix
x = rand(n);
a = 2;
b = -2;
for i = 1:n
    for j = 1:n
       y(i,j) = a + (b - a)*x(i,j);
    end
end
%to claculate d such that the square matrix diagonal is +ve
dia = 500 * rand(n,1);
dia = diag(dia);
y = y + dia;
%for symmetric matrix
r = rand(n);
l = triu(r) + triu(r,1)';
for i = 1:n
    for j = 1:n
        m(i,j) = a + (b - a)*l(i,j);
    end
end
%to claculate D such that the square matrix diagonal is +ve
dia1 = 1000 * rand(n,1);
dia1 = diag(dia1);
m = m + dia1;

%To claculate vector b using random numbers.
%Here consider b = B just to avoid ambiguity
q = 1;
z = rand(n,q);
for i = 1:n
    for j = 1:q
       B(i,j) = a + (b - a)*z(i,j);
    end
end
% To find L and U ie; Decomposing A into lower and upper triangular matrix
%To find the values of L and U
L=zeros(n);
U=zeros(n);
for i=1:n
% Finding L
    for k=1:i-1
        L(i,k)=y(i,k);
        for j=1:k-1
            L(i,k)= L(i,k)-L(i,j)*U(j,k);
        end
        L(i,k) = L(i,k)/U(k,k);
    end
    % Finding U
    for k=i:n
        U(i,k) = y(i,k);
        for j=1:i-1
            U(i,k)= U(i,k)-L(i,j)*U(j,k);
        end
    end
end
for i=1:n
    L(i,i)=1;
end

%just for verification
[W,Y] = lu(y);
%To calculate X for AX=b
[g,X] = LU_GGt(y,B,L,U,n);
Check = L*U;
%Find the error rate
FrobALU=Frobenius(y,Check,n);
%To find euclidian norm AX-B
E = y*X;
EuNorm1=Enorm(E,B);
%To find Cholesky GG'
%m is my A which is SPD
G = zeros(n);
for i=1:n
   G(i, i) = sqrt(m(i, i) - G(i, :)*G(i, :)');
   for j=(i + 1):n
      G(j, i) = (m(j, i) - G(i,:)*G(j ,:)')/G(i, i);
   end
end
%To check the cholesky G computation.
CholCheck = chol(m);
%Code to check Frobenius norm of A and GG'
CheckG = G*G';
FrobAGGt=Frobenius(m,CheckG,n);
%to find X for AX=b
[g1,X1] = LU_GGt(m,B,G,G',n);
E = m*X1;
EuNorm2=Enorm(E,B);
if(n<10)
    fprintf('For a non-singluar square matrix \n');
    disp(y);
    fprintf('The decompostion of lower triangluar matrix \n');
    disp(L);
    fprintf('The decompostion of upper triangluar matrix \n');
    disp(U);
    fprintf('Check the values of L and U by matlab function \n');
    disp(W);
    disp(Y);
    fprintf('To find X, from AX=b\n');
    fprintf('Random vector b \n');
    disp(B);
    fprintf('value of g obatined from L and b \n');
    disp(g);
    fprintf('value of X obatined from U and g \n');
    disp(X);
    fprintf('For a symmetric positive definite matrix \n');
    disp(m);
    fprintf('The decompostion of upper triangluar matrix \n');
    disp(G);
    fprintf('The decompostion of lower triangluar matrix \n');
    disp(G');
    fprintf('To check Cholskey decomposition using matlab function \n');
    disp(CholCheck);
    fprintf('To find X, from AX=b\n');
    fprintf('Random vector b \n');
    disp(B);
    fprintf('value of g obatined from L and b \n');
    disp(g1);
    fprintf('value of X obatined from U and g \n');
    disp(X1);
end
fprintf('Correctness of the solution\n');
fprintf('For a non-singluar matrix \n');
disp(FrobALU);
fprintf('For a SPD matrix \n');
disp(FrobAGGt);
fprintf('For non-singular AX=b \n');
disp(EuNorm1);
fprintf('For symmetric AX=b \n');
disp(EuNorm2);



