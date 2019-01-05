function suit = detect_suit(CARD)
% CARD: RGB image of the card (uint8 type)
%
% suit: char type, possible values:
%         'C' for clubs (♣)
%         'D' for diamonds (♦)
%         'H' for hearts (♥)
%         'S' for spades (♠)

    suits = load('input/suits.mat');
    
    color = detect_color(CARD);
    B = CARD(:,:,3);
    card_masked = B<150;
    
    switch color
        case 'R'
            hearts = conv2(card_masked, suits.hearts);
            diamonds = conv2(card_masked, suits.diamonds);
            max_h = max(hearts(:));
            max_d = max(diamonds(:));
            if max_h >= max_d
                suit = 'H';
            else
                suit = 'D';
            end
            
        case 'B'
            spades = conv2(card_masked, suits.spades);
            clubs = conv2(card_masked, suits.clubs);
            max_s = max(spades(:));
            max_c = max(clubs(:));
            if max_s >= max_c
                suit = 'S';
            else
                suit = 'C';
            end
    end
    
end
