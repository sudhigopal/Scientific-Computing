A = [1 0
    0 2];
%Since the array starts from 1, we are forced to take the loop from 1 to
%11, instead of 0 to 10. Hence, I have initialized the vectors from 1 to 11
X = zeros(2,11);
X(:,1) = [2;1];
r = zeros(2,11);
r(:,1)= - A*X(:,1);
fx = zeros();
f = zeros();
f(:,1) = (1/2) * X(:,1)' * A * X(:,1); 
k = 1;
while k > 0

     X(:,k+1) = (1/3)^k * [2 ; (-1)^k];
     fx(:,k) = (1/2) * X(:,k)' * A * X(:,k); 
     f(:,k+1) = f(k)/9;
     if ((r(:,k)'*r(:,k))<= 10^-3)
        break;
     end
     r(:,k+1) = -A * X(:,k+1);  
     k = k+1;
end
fprintf('f(x) through direct method\n');
disp(fx);
fprintf('f(x) through f(x)/9 \n');
disp(f);

ei = eig(A);
a = max(ei);
fprintf('maximum eigen value %f\n',a);
b = min(ei);
fprintf('minimum eigen value %f\n',b);
beta = ((a-b)/(a+b))^2;

e = zeros(size(r));
e(:,1) = -(A\r(:,1));
Ex = zeros();
Ex(:,1) = 1/2 * (e(:,1)'*A*e(:,1));
for i = 1 : 20
    Ex(:,i+1) = (1 - ((r(:,i)'*r(:,i))^2 / ((r(:,i)'*A*r(:,i))*(r(:,i)'*(A\r(:,i)))))) * Ex(:,i);
    if (Ex(:,i+1)<= (beta*Ex(:,i)))
        break;
    end
end
fprintf('convergence through E(Xk)\n');
disp(Ex);
