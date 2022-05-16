% Parameters
N = 10000;
T = 200;

set(0, 'defaultfigurecolor', [1 1 1]);
set(0, 'defaultaxesfontname', 'Palatino');
set(0, 'defaultaxesfontsize', 14);

% Compare ERG with cliq
figure;
hold on;

type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + 100 + "_lambda" + lambda + "_d2_T" + T, T, "-"); 

type = "ERGlog2";
service = "exprnd";
lambda = 0.8;
AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "--"); 

%type = "clique";
%service = "exprnd";
%lambda = 0.8;
%AggregateQueue(type + "_" + service + "_N" + N + "_lambda" + lambda + "_d2_T" + T, T, "--");

[t, y] = ode45(@FluidLimit, [0 T], [1; zeros(99, 1)]);
h = plot(t, [y(:, 2) y(:, 3) y(:, 4) y(:, 5)]);
set(h, {"Color"}, {'k'; 'k'; 'k'; 'k'});
%set(h, {"LineStyle"}, {ls; ls; ls; ls});

xlabel("Time");
legend({"q$_1 \left(N = 10^2\right)$", "q$_2 \left(N = 10^2\right)$", "q$_3 \left(N = 10^2\right)$", "q$_4 \left(N = 10^2\right)$", "q$_1 \left(N = 10^4\right)$", "q$_2 \left(N = 10^4\right)$", "q$_3 \left(N = 10^4\right)$", "q$_4 \left(N = 10^4\right)$", "fluid limit"}, "FontSize", 14, "Interpreter", "latex");
ylim([0 0.9]);