function [g, alpha] = updateSubgradient(x,f,query,U,N,ep)
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
    
    [m,max_i] = max([ones(1, N) * x - U;-x;x-f(query,1)]);
    if m <= 0
        g = getSubgradient(x,f,query);
        alpha = -1;
    else
        if max_i == 1
            g = - ones(N,1);
        elseif max_i <= 1 + N
            g = zeros(N,1);
            g(max_i - 1) = -1;
        else 
            g = zeros(N,1);
            g(max_i - 1 - N) = 1;
        end
        alpha = (m + ep)/(norm(g)^2);
    end

end