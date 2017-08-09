function [g,X] = LU_GGt(y,B,L,U,n)
    %To compute g:- L*g = b
    g=zeros(n,1);
    g(1)=B(1)/L(1,1);
    for i=2:n
        g(i)=-L(i,1)*g(1);
        for k=2:i-1
            g(i)=y(i)-L(i,k)*g(k);
            g(i)=(B(i)+y(i))/L(i,i);
        end
    end
    %To compute X :- U*X = g
    X=zeros(n,1);
    X(1)=g(1)/U(1,1);
    for i=2:n
        X(i)=-U(i,1)*X(1);
        for k=i:n
            X(i)=X(i)-U(i,k)*X(k);
            X(i)=(g(i)+X(i))/U(i,i);
        end
    end
end