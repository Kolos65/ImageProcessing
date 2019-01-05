function MODEL = training_phase(T_cell)
    N = length(T_cell);
    MODEL = zeros(N,9);
    for i=1:N
        for k=1:9
            H = laws_kernel(k);
            A2 = conv2(T_cell{i},H,'same').^2;
            h = size(T_cell{i},1);
            w = size(T_cell{i},2);
            MODEL(i,k) =  sum(A2(:)) / (h*w);
        end
    end
end