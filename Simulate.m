function Xt = Simulate(H, X, service, lambda, d, T)

tic;
N = size(H, 1);

% Setup tracking process
Xt = zeros(N, T + 1);

Xt(:, 1) = X;
tstep = 1;

% Iterate
t = 0;
while t < T
    nextArrival = t + exprnd(1 / (lambda * N));
    nextDeparture = t + exprnd(1 / N);
    t = min(nextDeparture, nextArrival);
    
    if t == nextArrival
        % Select one of the dispatchers
        j = ceil(unifrnd(0, 1) * N);
        
        if size(H{j}, 2) > 0
            % Sample d and select the minimum
            sample = randsample(H{j}, d, true);
            [~, i] = min(X(sample));
            i = sample(i);

            % Add a job
            X(i) = X(i) + 1;
        end
    else
        % Select one of the dispatchers
        i = ceil(unifrnd(0, 1) * N);
        
        % Remove a job
        if X(i) > 0
            X(i) = X(i) - 1;
        end
    end
    
    % Update the tracking process
    while t >= tstep && tstep <= T
        Xt(:, tstep + 1) = X;
        tstep = tstep + 1;
        
        time = toc;
        disp("Finished step " + t + " of " + T);
        disp("Elapsed time is " + time / 60 + " minutes");
        disp("Estimated time left is " + (T - t) * time / (t * 60) + " minutes");
    end
end