function y = getValue(x,f,query)
    y = zeros(size(x),1);
    y(1) = convexFunction(x(1),f(1:query(1),:));
    for i = 2:size(x)
        y(i) = convexFunction(x(i), f((query(i-1)+1):(query(i)),:));
    end
    
end