function PlotWaitingTime(type, lambda, d, T, det)

Nlim = [5 * 10^2 10^3 2 * 10^3 5 * 10^3 10^4];
W = zeros(size(Nlim, 2), 1);

for i = 1:size(Nlim, 2)
    if det == 1
        load(type + "_N" + Nlim(i) + "_lambda" + lambda + "_d" + d + "_T" + T + "_det1.mat", "Xt", "N");
    else
        load(type + "_N" + Nlim(i) + "_lambda" + lambda + "_d" + d + "_T" + T + ".mat", "Xt", "N");
    end
    
    W(i) = (mean(Xt, "all") - mean(sum(Xt == 1, 1)) / N) / lambda;
end

plot(Nlim, W, "-o");