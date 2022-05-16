function H = ERG_Adjacency(N, p)

H = cell(N, 1);

for i = 1:N
    v = unifrnd(0, 1, 1, N) < p;
    H{i} = find(v);
end