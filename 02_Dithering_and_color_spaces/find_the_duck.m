function duck = find_the_duck(I)
    B = I(:,:,3);
    duck = B < 100;
end