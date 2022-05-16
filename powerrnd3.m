function r = powerrnd3(mean)

u = rand;
r = (1 - u)^(1 / (-3 + 1)) - 1;