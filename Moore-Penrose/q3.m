%Sudhindra Gopal Krishna
%113359296
%question 3
H1 = [ 1 2 3 4 ]';
H2 = [ 1 1 1 1 ; 1 2 3 4 ]';
Hp1 = (H1' * H1) \ H1';
Hp2 = (H2' * H2) \ H2';
Ph1 = H1 * Hp1
Ph2 = H2 * Hp2
PH = Ph1 * Ph1
Ph = Ph2 * Ph2
%question 4
z = [4 3 2 1]';
zcap1 = Ph1 * z
zcap2 = Ph2 * z
r1 = z - zcap1
r2 = z - zcap2