function sum1 = Frobenius(y,Check,m,n)
    %Code to check Frobenius norm of A and LU and GG'
    sum1=0;
    for j = 1 : n
        for i = 1 : m
           sum1 = sum1 + (y(i,j) - Check(i,j))^2;
        end
    end
end