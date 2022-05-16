% Parameters
N = 10000;
T = 200;

set(0, 'defaultfigurecolor', [1 1 1]);
set(0, 'defaultaxesfontname', 'Palatino');
set(0, 'defaultaxesfontsize', 12);

% Compare ERG with cliq
figure;

type = "ERG3";
service = "exprnd";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "-"); 

hold on;

type = "clique";
service = "exprnd";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "--");

[t, y] = ode45(@FluidLimit, [0 T], [1; zeros(99, 1)]);
h = plot(t, [y(:, 2) y(:, 3) y(:, 4) y(:, 5)]);
set(h, {"Color"}, {'k'; 'k'; 'k'; 'k'});
%set(h, {"LineStyle"}, {ls; ls; ls; ls});

xlabel("Time");
legend({"q_1 ERRG", "q_2 ERRG", "q_3 ERRG", "q_4 ERRG", "q_1 clique", "q_2 clique", "q_3 clique", "q_4 clique", "fluid limit"}, "FontSize", 12);
ylim([0 0.9]);