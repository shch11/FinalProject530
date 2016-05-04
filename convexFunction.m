function y = convexFunction(x, F)
    n = size(F,1);
    if x < F(1,1)
        y = 0;
    end
    for i = 2:n
        if x >= F(i-1,1) && x < F(i,1)
            y = F(i-1,2) + F(i,3) * (x - F(i-1,1));
            return;
        end
    end
    if x >= F(n,1)
        y = F(n,2);
    end
end