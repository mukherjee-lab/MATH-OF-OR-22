% ERGlogsqrt
for i = 4:10
    Main(1 * 10^4, "clique", @deterministic, 0.8, 2, 200, i);
end