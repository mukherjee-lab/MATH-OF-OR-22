function W = CalculateQueueLength(type, lambda)

Nlim = [5 * 10^2 10^3 2 * 10^3 5 * 10^3 10^4 2 * 10^4 5 * 10^4 10^5 2 * 10^5];
W = nan(size(Nlim, 2), 50);

for i = 1:size(Nlim, 2)
    for j = 1:50
        if isfile("Data/" + type + "_N" + Nlim(i) + "_lambda" + lambda + "_d2_T200_i" + j + ".mat")
            load("Data/" + type + "_N" + Nlim(i) + "_lambda" + lambda + "_d2_T200_i" + j + ".mat", "Xt");

            Xt = Xt(:, 150:200);
            W(i, j) = mean(Xt, "all");
        else
            break;
        end
    end
end