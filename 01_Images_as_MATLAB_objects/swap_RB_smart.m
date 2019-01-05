function [BGR] = swap_RB_smart(RGB)
    BGR = RGB;
    BGR(:,:,1) = RGB(:,:,3);
    BGR(:,:,3) = RGB(:,:,1);
    %R = RGB(:,:,1);
    %G = RGB(:,:,2);
    %B = RGB(:,:,3);
    %BGR = concat(B,G,R,3)
end