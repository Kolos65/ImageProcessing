function newF = mask_fourier(F, x, y, r)
    F = fftshift(F);
    for i=1:size(x)
        x_ = round(x(i));
        y_ = round(y(i));
        x1 = max(1, x_-r);
        x2 = min(size(F,1),x_+r);
        y1 = max(1, y_-r);
        y2 = min(size(F,2),y_+r);
        F(y1:y2, x1:x2) = 0+0i;
    end
    newF = ifftshift(F);
end