function dy = FluidLimit(t, y)

lambda = 0.8;
dy = zeros(100, 1);

for i = 2:99
    dy(i) = lambda * (y(i - 1)^2 - y(i)^2) - (y(i) - y(i + 1));
end

dy(100) = lambda * (y(100 - 1)^2 - y(100)^2) - y(100);