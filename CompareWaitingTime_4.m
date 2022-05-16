% Parameters
Nlim = [5 * 10^2 10^3 2 * 10^3 5 * 10^3 10^4];
d = 2;

set(0, 'defaultfigurecolor', [1 1 1]);
set(0, 'defaultaxesfontname', 'Palatino');
set(0, 'defaultaxesfontsize', 14);
C = linspecer(3);

% Compare ERG with clique
figure;
hold on;

type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
l8 = CalculateQueueLength(type + "_" + service, lambda);
l8 = nanmean(l8, 2);
optim8 = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));

type = "ERGlog2";
service = "exprnd";
lambda = 0.75;
l75 = CalculateQueueLength(type + "_" + service, lambda);
l75 = nanmean(l75, 2);
optim75 = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));

type = "ERGlog2";
service = "exprnd";
lambda = 0.7;
l7 = CalculateQueueLength(type + "_" + service, lambda);
l7 = nanmean(l7, 2);
optim7 = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));

type = "ERGlog2";
service = "exprnd";
lambda = 0.65;
l65 = CalculateQueueLength(type + "_" + service, lambda);
l65 = nanmean(l65, 2);
optim65 = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));

plot([0.65 0.7 0.75 0.8], [l65(5) l7(5) l75(5) l8(5)], "-o", "Color", C(1, :), "LineWidth", 1.5, "MarkerFaceColor", C(1, :));
plot([0.65 0.7 0.75 0.8], [l65(3) l7(3) l75(3) l8(3)], "-s", "Color", C(2, :), "LineWidth", 1.5, "MarkerFaceColor", C(2, :));
plot([0.65 0.7 0.75 0.8], [l65(1) l7(1) l75(1) l8(1)], "-^", "Color", C(3, :), "LineWidth", 1.5, "MarkerFaceColor", C(3, :));
plot([0.65 0.7 0.75 0.8], [optim65 optim7 optim75 optim8], '--k');

xlabel("\lambda");
ylabel("Mean queue length");
legend({"$N = 10^4$", "$N = 2 \times 10^3$", "$N = 5 \times 10^2$", "fixed point of $\textbf{q}^*$"}, "Location", "southeast", "FontSize", 14, "Interpreter", "latex");