function [LUT, M] = mykmeans(S, k)
    t=0;
    [LUT, M] = step1_initialization(S, k);
    converged = false;
    e = 0.02;
    while ~converged && t<100
        LUT = step2_assignment(S, k, LUT, M);
        M_old = M;
        M = step3_update(S, k, LUT, M);
        M_diff = (M - M_old).^2;
        M_dist = sum(M_diff(:));
        if M_dist < e
            converged = true;
        end
        t = t + 1;
    end
    fprintf('Iteration finished after %d steps.\n', t);
end
