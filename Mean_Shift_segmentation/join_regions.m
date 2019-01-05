function [cluster_space] = join_regions(filtered_space, distance_th)
    euc = @(a,b) norm(b-a);

    N = size(filtered_space,1);
    cluster_space = zeros(N,1);
    
    FIFO = {};    
    clustered = 0;
    clusterlabel = 0;
    while(clustered < N)
        if isempty(FIFO)
            ind = find(~cluster_space,1);
            x = filtered_space(ind,:);
            clusterlabel = clusterlabel + 1;
            cluster_space(ind) = clusterlabel;
            clustered = clustered + 1;
            for i=1:N
                if cluster_space(i) == 0 && euc(filtered_space(i,:),x)<distance_th
                    cluster_space(i) = clusterlabel;
                    clustered = clustered + 1;
                    FIFO = fifo_enqueue(FIFO, filtered_space(i,:));
                end
            end
        else
            [FIFO, fv] = fifo_dequeue(FIFO);
            for i=1:N
                if cluster_space(i) == 0 && euc(filtered_space(i,:),fv)<distance_th
                    cluster_space(i) = clusterlabel;
                    clustered = clustered + 1;
                    FIFO = fifo_enqueue(FIFO, filtered_space(i,:));
                end
            end
        end
        
    end
end