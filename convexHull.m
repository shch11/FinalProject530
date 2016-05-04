function y = convexHull(x1,x2)
    K = convhull(x1,x2);
    newK = flipud(K(2:size(K)));
    n = size(newK);
    F = [0, 0, 0];
    for i = 2:n
        F = [F; x1(newK(i)), - x2(newK(i)), - x2(newK(i)) / x1(newK(i))];
    end
    y = F;
end