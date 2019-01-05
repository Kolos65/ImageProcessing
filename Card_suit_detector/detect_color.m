function color = detect_color(CARD)
% CARD: RGB image of the card (uint8 type)
%
% color: char type, possible values:
%         'R' for red
%         'B' for black  

    RG = CARD(:,:,1)-CARD(:,:,2);
    sumRG = sum(RG(:));
    if sumRG > 500000
        color = 'R';
    else
        color = 'B';
    end
end