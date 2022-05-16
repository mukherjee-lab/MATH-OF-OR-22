function h = PlotQueueLength(type, lambda)

Nlim = [5 * 10^2 10^3 2 * 10^3 5 * 10^3 10^4 2 * 10^4 5 * 10^4 10^5 2 * 10^5];
W = CalculateQueueLength(type, lambda);

h = errorbar(log(Nlim), nanmean(W, 2), 3 * nanstd(W, 0, 2) ./ sum(~isnan(W), 2));