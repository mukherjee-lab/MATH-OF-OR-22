function H = RGG_Adjacency(N, p)

r = sqrt(p / pi);

% Uniform positions
rV = rand(N, 2);
rW = rand(N, 2);

H = cell(N, 1);

for i = 1:N
    v = zeros(1, N);
    
    for j = 1:N
        % Periodic boundary conditions
        dist = min([abs(rW(i, :) - rV(j, :)); abs(rW(i, :) - rV(j, :) + 1); abs(rW(i, :) - rV(j, :) - 1)]);
        
        if dist < r
            v(1, j) = 1;
        end
    end
    
    H{i} = find(v);
end