function Euclidian_norm = Enorm(E,B)
    Euclidian_norm = sqrt(sum((E-B).^2));
end