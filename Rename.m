type = "ERGlog2_exprnd";
lambda = 0.8;

for N = 10^2
    for i = 1:200
        movefile(type + "_N" + N + "_lambda" + lambda + "_d2_T200_i" + i + ".mat", type + "_N" + N + "_lambda" + lambda + "_d2_T200_i" + (i + 200) + ".mat");
    end
end