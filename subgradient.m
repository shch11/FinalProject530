%subgradient method

load('data.mat');
max_iter = 10;
U = 5;
N = size(L,1);
query = uint8(zeros(N,1)); % mark which query it is in f
%landscape
Hull = convexHull(L(1,:,1),L(1,:,2));
query(1) = size(Hull,1);
f = Hull;
for i = 2:N
    Hull = convexHull(L(i,:,1),L(i,:,2));
    query(i) = query(i-1) + size(Hull,1);
    f = [f;Hull];
end


% set starting point x
x = zeros(size(L,1),1);
one = ones(1,size(L,1));

% set starting g
g = updateSubgradient(x,f,query,U,N);

alpha = 1/norm(g)^2;
f_best = getValue(x,f,query);
% start iteration
for i = 1:max_iter
    x = x - alpha .* g;
    value = getValue(x,f,query);
    if (value < f_best)
        f_best = value;
    end
    g = updateSubgradient(x,f,query,U,N);
    alpha = (value - f_best + 10/(10+i))/(norm(g)^2);
end