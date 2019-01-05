function B = ordered_dither(I, D)
    [Ir, Ic] = size(I);
    [Dr, Dc] = size(D);
    D2 = repmat(D,Ir/Dr,Ic/Dc);
    B = double(I>D2);
end