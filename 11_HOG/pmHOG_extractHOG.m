function norm_HOG = pmHOG_extractHOG(I)
    [H, W] = size(I);
    h = H/8;
    w = W/8;
    
    HIST = zeros(h-1,w-1,36);
   
    cut = @(a) (a-1)*8 + 1;
    for row = 1:h-1 
        for col = 1:w-1 
            x = cut(row);
            y = cut(col);
            G = I(x:x+15, y:y+15);
            G = imgaussfilt(G, 0.1);
            hist = zeros(1,36);
            for i = 1:2
                for j = 1:2
                    x = cut(i);
                    y = cut(j);
                    cell = G(x:x+7,y:y+7);
                    [PHI, MAG] = pmHOG_gradient(cell);
                    H = pmHOG_binner(PHI, MAG);
                    num = (i-1)*2 + j;
                    index = (num-1)*9 + 1;
                    hist(index:index+8) = H;
                end
            end
            sumhist = sum(hist(:));
            hist = hist./sumhist;
            HIST(row,col,:) = hist;
        end
    end
    norm_HOG = HIST;    
end
