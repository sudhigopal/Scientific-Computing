A = [1 0
    0 4];
%Since the array starts from 1, we are forced to take the loop from 1 to
%11, instead of 0 to 10. Hence, I have initialized the vectors from 1 to 11
X = zeros(2,11);
X(:,1) = [4;1];
Y = zeros(2,11);
Y(:,1) = [4;1];
r = zeros(2,11);
r(:,1)= - A*X(:,1);
alpha = zeros();
%Verifying X(k) = ((lambda - 1)/(lamda+1))^k * [lamda;(-1)^k]
for k = 1 : 10
     X(:,k+1) = (3/5)^k * [4 ; (-1)^k];
     if ((r(:,k)'*r(:,k))<= 10^-9)
        break;
     end
     r(:,k+1) = -A * X(:,k+1);
end
%to check the previous method of generating X is correct through steep
%decent algorithm.
r1 = zeros(2,11);
r1(:,1)= - A*X(:,1);
for j = 1 : 10
    alpha = (r(:,j)'*r(:,j))/(r(:,j)'*A*r(:,j));
    Y(:,j+1) = Y(:,j) + alpha*r(:,j);
    if ((r(:,j)'*r(:,j))<= 10^-9)
        break;
    end
    r1(:,j+1) = r(:,j) - alpha*A*r(:,j);
end
fprintf('Value of X from X0 till X10 are\n');
disp(X);
fprintf('Value of r from r0 till r10 are\n');
disp(r);
fprintf('Value of X thru steep decent algorithm\n');
disp(Y);
%to verify orthogonality

for k = 1 : 10
    O = dot(r(:,k),r(:,k+1));
    if(O <= 10^-9)
        fprintf('r%d and r%d are orthogonal \n',k-1, k);
    end
end

%To verify r1 and r3 are orthogonal. Here r1 is the second column in the
%vector.
check = r(:,2)'*r(:,4);
if(check == 0)
    fprintf('r1 and r3 are othogonal\n');
else
    fprintf('\nr1 and r3 are not orthogonal\n');
    disp(check);
end

%To plot graph
for i = 1:11
    a(i) = X(1,i);
    b(i) = X(2,i);
    plot(a,b);
    grid on;  
    title('Zig-Zag behavior of steep decent algorithm');
    xlabel('Xk');
    ylabel('k');
end