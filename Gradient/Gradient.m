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

j=1;
while j>0
    alpha = (r(:,j)'*r(:,j))/(r(:,j)'*A*r(:,j));
    X(:,j+1) = X(:,j) + alpha*r(:,j);
    if ((r(:,j)'*r(:,j))<= 10^-9)
        break;
    end
    r(:,j+1) = r(:,j) - alpha*A*r(:,j);
    j=j+1;
end
f = zeros(1);
f(:,1) = 1/2*(X(:,1)'*A*X(:,1)) - (b'*X(:,1)) + C;
i = 1;
while i>0
    i=i+1;
    f(:,i) = 1/2*(X(:,i)'*A*X(:,i)) - (b'*X(:,i)) + C;
    if(i>j)
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
    title('Enhanced plot for Gradient Method');
    grid on;
    figure
    plot(f);
    xlabel('k');
    ylabel('f(k)');
    title('Gradient Method');
    grid on;   
else
    plot(f);
    xlabel('k');
    ylabel('f(k)');
    title('Gradient Method');
    grid on;
    fprintf('Gradient Algorithm\n');
    disp(X);
    fprintf('Gradient f(x)\n');
    disp(f);
end
