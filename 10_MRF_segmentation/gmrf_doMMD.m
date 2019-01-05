function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat');
            h = mrf.imagesize(1);
            w = mrf.imagesize(2);
         cnum = mrf.classnum;
         beta = mrf.Beta;
    DeltaUmin = mrf.DeltaUmin;
            T = mrf.T0;
            c = mrf.c;       

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        summa_deltaE = 0;
        cycle = cycle + 1;
        for y=1:h
            for x=1:w
                act_label = mrf.classmask(y,x);
                neib = cell(8,0);
                M = [1 0; 0 1; 1 1; -1 0; 0 -1; -1 -1; 1 -1; -1 1];
                for i = 1:8
                    n = [x, y] + M(i,:);
                    if n(1) <= w && n(1) > 0 && n(2) <= h && n(2) > 0
                        neib{i} = mrf.classmask(n(2),n(1));
                    end
                end
                neib = neib(~cellfun('isempty',neib));
                
                act_post_prob = mrf.logProbs{act_label}(y, x);
                
                %Calc matching, non matching label nums
                
                matching = 0;
                different = 0;
                for i = 1:numel(neib)
                    if act_label == neib{i}
                        matching = matching + matching;
                    else
                        different = different+1;
                    end
                end
                
                act_prior_prob = act_post_prob - beta * matching + beta * different;
                
                %Pick a new label
                                
                random_label = randi(cnum);
                
                new_post_prob = mrf.logProbs{random_label}(y, x);
                
                matching = 0;
                different = 0;
                for i = 1:numel(neib)
                    if random_label == neib{i}
                        matching = matching + matching;
                    else
                        different = different+1;
                    end
                end
                
                new_prior_prob = new_post_prob - beta * matching + beta * different;
                
                U_act = act_prior_prob + act_post_prob;
                U_new = new_post_prob + new_prior_prob;
                
                dU = U_new - U_act;
                rand_num = rand();
                if dU < 0 || rand_num < exp(-dU/T)
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y,x) = random_label;
                end
            end
        end
        T = T * c;
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        title(['Class map in cycle ', num2str(cycle)]);
        pause(0.1);
    end
end
