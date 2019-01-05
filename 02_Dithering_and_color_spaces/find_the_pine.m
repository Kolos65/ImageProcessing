function pine = find_the_pine(I)    
    HSV = rgb2hsv(I);
    H = HSV(:,:,1);
    pine = H < 0.155;
end