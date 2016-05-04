function g = updateSubgradient(x,f,query,U,N)
    if (ones(1, N) * x > U)
        g = - ones(N,1);
        return;
    end
    
    for i = 1: N
        if x(i) < 0
            g = zeros(N,1);
            g(i) = -1;
            return;
        end
        if x(i) > f(query(i),1)
            g = zeros(N,1);
            g(i) = 1;
            return;
        end
    end
    
    g = getSubgradient(x,f,query);

end