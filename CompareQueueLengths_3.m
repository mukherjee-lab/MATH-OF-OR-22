% Parameters
N = 10000;
T = 200;

set(0, 'defaultfigurecolor', [1 1 1]);
set(0, 'defaultaxesfontname', 'Palatino');
set(0, 'defaultaxesfontsize', 12);

% Compare ERG with cliq
figure;

type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "-"); 

hold on;

type = "ERGlog2";
service = "deterministic";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "--");

type = "ERGlog2";
service = "powerrnd3";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, ":");

xlabel("Time");
legend({"q_1 exp", "q_2 exp", "q_3 exp", "q_4 exp", "q_1 det", "q_2 det", "q_3 det", "q_4 det", "q_1 pow", "q_2 pow", "q_3 pow", "q_4 pow"});
ylim([0 0.9]);