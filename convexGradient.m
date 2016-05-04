function g = convexGradient(x, F)
    n = size(F,1);
    for i = 2 : (n-1)
        if x == F(i,1)
            g = F(i-1,3) + rand * ( F(i,3) - F(i-1,3));
            return;
        end
    end
    for i = 2:n
        if x >= F(i-1,1) && x < F(i,1)
            g = F(i,3);
            return;
        end
    end
    if x >= F(n,1)
        g = 0;
    end
end