function [BGR] = swap_RB_dump(RGB)
    BGR = RGB;
    for r = 1:size(RGB,1)
        for c = 1:size(RGB,2)
            tmp = BGR(r,c,1);
            BGR(r,c,1) = BGR(r,c,3);
            BGR(r,c,3) = tmp;
        end
    end
end