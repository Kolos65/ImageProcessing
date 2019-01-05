function MASK = create_mask(IMG)
%  IMG: RGB image in uint8 format (from 0 to 255) 
%
% MASK: logical array (only zeros and ones).
%        0 if not card,
%        1 if card
    R = IMG(:,:,1);
    G = IMG(:,:,2);
    GR = G-R;
    MASK = GR < 40;
end