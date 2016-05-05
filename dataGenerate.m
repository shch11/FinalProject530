function L = dataGenerate(N, max_q)
    %N = 20;
    %max_q = 10;

    L = zeros(N, max_q + 1, 2);

    for i = 1:N
        q = round(rand * (max_q-1));
    
        if q < 4
            q = 4;
        end
    
        m = round(rand * 10 ) + 1;
    
        bid = m .* sort(rand(q,1));
        click = sort(rand(q,1));
        cost = bid .* click;
    
        L(i,2:q+1,1) = cost;
        L(i,2:q+1,2) = click;
    end

%save('data1.mat', 'L');
end