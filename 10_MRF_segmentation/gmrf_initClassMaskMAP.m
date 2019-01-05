function mrf=gmrf_initClassMaskMAP(mrf)

    cmap = load('MRF_colormap.mat');
       h = mrf.imagesize(1);
       w = mrf.imagesize(2);
    cnum = mrf.classnum;

    for y=1:h
        for x=1:w
            minval = mrf.logProbs{1}(y,x);
            minind = 1;
            for i = 2:numel(mrf.logProbs)
                if mrf.logProbs{i}(y,x) < minval
                    minval = mrf.logProbs{i}(y,x);
                    minind = i;
                end
            end
            mrf.classmask(y,x) = minind;
            
        end
    end
    
    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));

end