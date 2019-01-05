function [ mode ] = find_mode(feature_space, index, bandwidth, conv_threshold)
    x = feature_space(index, :);
    
    euc = @(a,b) norm(b-a);
    
    while(true)
        msum1 = [0,0,0];
        msum2 = [0,0,0];
    
        for i=1:size(feature_space,1)
            xi = feature_space(i,:);
            if euc(x,xi) < bandwidth
                d = kernel_function(norm((x - xi)./bandwidth)^2);
                msum1 = msum1 + xi.*d;
                msum2 = msum2 + d;
            end
        end
        m = msum1./msum2;
        shift_vector = m - x;
        x = m;
        if norm(shift_vector) < conv_threshold
            break;
        end
    end
    mode = x;
end