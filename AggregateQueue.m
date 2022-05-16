function Q = AggregateQueue(type, T, ls)

% Aggregate
Q = zeros(4, T + 1);
its = 0;

for i = 1:401
    if isfile("Data/" + type + "_i" + i + ".mat")
        load("Data/" + type + "_i" + i + ".mat", "Xt");

        for j = 1:4
            Q(j, :) = Q(j, :) + sum(Xt >= j);
        end
    else
        its = i - 1;
        break;
    end
end

Q = Q ./ its;

% Plot
h = plot(0:T, Q ./ size(Xt, 1));
C = linspecer(4);
set(h, {"Color"}, {C(1, :); C(2, :); C(3, :); C(4, :)});
set(h, {"LineStyle"}, {ls; ls; ls; ls});
set(h, {"LineWidth"}, {1.5; 1.5; 1.5; 1.5});

xlabel("Time");
legend("q1", "q2", "q3", "q4");