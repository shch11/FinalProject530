function g = getSubgradient(x,f,query)
    g = zeros(size(x,1),1);
    g(1) = convexGradient(x(1),f(1:query(1),:));
    for i = 2:size(x)
        g(i) = convexGradient(x(i), f((query(i-1)+1):(query(i)),:));
    end
    
end