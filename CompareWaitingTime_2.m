% Parameters
Nlim = [5 * 10^2 10^3 2 * 10^3 5 * 10^3 10^4];
d = 2;

set(0, 'defaultfigurecolor', [1 1 1]);
set(0, 'defaultaxesfontname', 'Palatino');
set(0, 'defaultaxesfontsize', 14);
C = linspecer(6);
Cx = linspecer(14);

% Compare ERG with clique
figure;
hold on;

% constant
type = "RGG3";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(4, :));
set(h, "Marker", "o");
set(h, "MarkerFaceColor", C(4, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "ERG3";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(3, :));
set(h, "Marker", "o");
set(h, "MarkerFaceColor", C(3, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

% log
type = "RGGlog";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(1, :));
set(h, "Marker", "s");
set(h, "MarkerFaceColor", C(1, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "ERGlog";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(2, :));
set(h, "Marker", "s");
set(h, "MarkerFaceColor", C(2, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

% log2
type = "RGGlog2";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", Cx(1, :));
set(h, "Marker", "^");
set(h, "MarkerFaceColor", Cx(1, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", Cx(14, :));
set(h, "Marker", "^");
set(h, "MarkerFaceColor", Cx(14, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

optim = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));
yline(optim, '--');

xlabel("Number of servers");
xticks(log([10^3 10^4 10^5]));
xticklabels(["10^3", "10^4", "10^5"]);
ylabel("Mean queue length");
ylim([1.5 10]);
legend({"RGG$(3)$", "ERRG$(3)$", "RGG$\left(\ln(N)\right)$", "ERRG$\left(\ln(N)\right)$", "RGG$\left(\ln(N)^2\right)$", "ERRG$\left(\ln(N)^2\right)$", "fixed point of $\textbf{q}^*$"}, "Location", "northeast", "FontSize", 14, "Interpreter", "latex");