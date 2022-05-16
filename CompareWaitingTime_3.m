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

% powerrnd
type = "ERGlog2";
service = "powerrnd3";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(4, :));
set(h, "Marker", "o");
set(h, "MarkerFaceColor", C(4, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "clique";
service = "powerrnd3";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(3, :));
set(h, "Marker", "o");
set(h, "MarkerFaceColor", C(3, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

% exp
type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(1, :));
set(h, "Marker", "s");
set(h, "MarkerFaceColor", C(1, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "clique";
service = "exprnd";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", C(2, :));
set(h, "Marker", "s");
set(h, "MarkerFaceColor", C(2, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

% deterministic
type = "ERGlog2";
service = "deterministic";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", Cx(1, :));
set(h, "Marker", "^");
set(h, "MarkerFaceColor", Cx(1, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "-");

type = "clique";
service = "deterministic";
lambda = 0.8;
h = PlotQueueLength(type + "_" + service, lambda);
set(h, "Color", Cx(14, :));
set(h, "Marker", "^");
set(h, "MarkerFaceColor", Cx(14, :));
set(h, "LineWidth", 1.5);
set(h, "LineStyle", "--");

%optim = sum(lambda.^((d.^(1:1000) - 1) / (d - 1)));
%yline(optim, '--');

xlabel("Number of servers");
xticks([10^3 2 * 10^3 5 * 10^3 10^4]);
xticklabels(["10^3", "2x10^3" "5x10^3" "10^4"])
ylabel("Mean queue length");
%ylim([0 1.8]);
legend({"ERRG pow", "$K_{N,M}$ pow", "ERRG exp", "$K_{N,M}$ exp", "ERRG det", "$K_{N,M}$ det"}, "Location", "northeast", "FontSize", 14, "Interpreter", "latex");