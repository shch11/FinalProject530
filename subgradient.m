%subgradient method
N = 10;
max_q = 10;
% L = dataGenerate(N, max_q);


%load('data1.mat');
max_iter = 5000;
U = 5;
%N = size(L,1);
ep = 0.01;
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
g = updateSubgradient(x,f,query,U,N,ep);

alpha = 1/norm(g)^2;
f_best = sum(getValue(x,f,query));
track_value = - f_best;
track_best = - f_best;
% start iteration
for i = 1:max_iter
    x = x - alpha .* g;
    value = sum(getValue(x,f,query));
    if (value < f_best) && max([ones(1, N) * x - U;-x;x-f(query,1)]) <= 0
        f_best = value;
    end
    g = updateSubgradient(x,f,query,U,N,ep);
    if alpha == -1
        alpha = (value - f_best + 10/(10+i))/(norm(g)^2);
    end
    track_value = [track_value;-value];
    track_best = [track_best;-f_best];
end