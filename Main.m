function Main(N, type, service, lambda, d, T, i)

rng("shuffle");
serv = functions(service);
serv = serv.function;

%for i = 1:10
    filename = type + "_" + serv + "_N" + N + "_lambda" + lambda + "_d" + d + "_T" + T + "_i" + i + ".mat";

    if ~isfile(filename)
        tic;
        
        % Parameters
        if type == "clique"
            G = ones(N, N);
        elseif type == "ERG3"
            H = ERG_Adjacency(N, 3 / N);
        elseif type == "ERGlog"
            H = ERG_Adjacency(N, log(N) / N);
        elseif type == "ERGlog2"
            H = ERG_Adjacency(N, log(N)^2 / N);
        elseif type == "ERGlogsqrt"
            H = ERG_Adjacency(N, log(N) * sqrt(N) / N);
        elseif type == "ERGsqrt"
            H = ERG_Adjacency(N, sqrt(N) / N);
        elseif type == "RGG3"
            H = RGG_Adjacency(N, 3 / N);
        elseif type == "RGGlog"
            H = RGG_Adjacency(N, log(N) / N);
        elseif type == "RGGlog2"
            H = RGG_Adjacency(N, log(N)^2 / N);
        elseif type == "RGGlogsqrt"
            H = RGG_Adjacency(N, log(N) * sqrt(N) / N);
        elseif type == "RGGsqrt"
            H = RGG_Adjacency(N, sqrt(N) / N);
        else
            error("Unknown graph type");
        end

        X = zeros(N, 1);
        disp("Generated the random graph");

        % Simulate
        Xt = Simulate(H, X, service, lambda, d, T);

        % Plot
        %figure;
        %Plot(Xt, "-");

        % Save
        save(filename, "N", "G", "lambda", "d", "T", "Xt");
        
        % Print time
        toc;
    end
    
    % Print status
    disp("#" + i + " " + serv + " " + type + " N = " + N + " lambda = " + lambda);
%end