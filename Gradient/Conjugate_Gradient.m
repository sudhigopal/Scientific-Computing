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
q = 1;
z = rand(m,q);
for i = 1:m
    for j = 1:q
       Z(i,j) = a + (b - a)*z(i,j);
    end
end
C = rand(1,1);

A = H' * H;
b = (Z' * H)';

X = zeros(n,1);
X(:,1) = rand(n,1);
r = zeros(n,1);
r(:,1)= b - A*X(:,1);
p = zeros(n,1);
p(:,1) = r(:,1);

% alpha = p(:,1)'*r(:,1)/(p(:,1)'*A*p(:,1));
for i = 1 : n-1
    alpha = p(:,i)'*r(:,i)/(p(:,i)'*A*p(:,i));
    X(:,i+1) = X(:,i) + alpha * p(:,i);
    r(:,i+1) = r(:,i) - alpha*A*p(:,i);
    if (r(:,i+1)'*r(:,i+1))<10^-9
        break;
    end
    beta = r(:,i+1)'*r(:,i+1)/(r(:,i)'*r(:,i));
    p(:,i+1) = r(:,i+1) + beta*p(:,i);
end
f = zeros(1);
f(:,1) = 1/2*(X(:,1)'*A*X(:,1)) - (b'*X(:,1)) + C;
j = 1;
while j>0
    j=j+1;
    f(:,j) = 1/2*(X(:,j)'*A*X(:,j)) - (b'*X(:,j)) + C;
    if(j>i)
        break;
    end
end
figure
if m>10
    p = zeros(1);
    for w = 1 : 10
        p(:,w) = f(:,w);
    end
    plot(p);
    xlabel('k');
    ylabel('f(k)');
    title('Enchanced plot for Conjugate Gradient Method');
    grid on;
    figure
    plot(f);
    xlabel('k');
    ylabel('f(k)');
    title('Conjugate Gradient Method');
    grid on;   
else
    plot(f);
    xlabel('k');
    ylabel('f(k)');
    title('Conjugate Gradient Method');
    grid on;
    fprintf('Conjugate Gradient Algorithm\n');
    disp(X);
    fprintf('Conjugate Gradient f(x)\n');
    disp(f);
end
