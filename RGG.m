function G = RGG(N, p)

r = sqrt(p / pi);

% Uniform positions
rV = rand(N, 2);
rW = rand(N, 2);

G = zeros(N, N);

for i = 1:N
    for j = 1:N
        % Periodic boundary conditions
        dist = min([abs(rW(i, :) - rV(j, :)); abs(rW(i, :) - rV(j, :) + 1); abs(rW(i, :) - rV(j, :) - 1)]);
        
        if dist < r
            G(i, j) = 1;
        end
    end
end