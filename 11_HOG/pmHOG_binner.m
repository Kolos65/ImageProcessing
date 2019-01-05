function H = pmHOG_binner(PHI, MAG)
    H = zeros(1,9);
    min = -90:20:70;
    max = -70:20:90;
    for i=1:9
        LOG_MASK = (PHI >= min(i) & PHI < max(i));
        magnitudes = MAG(LOG_MASK);
        magsum = sum(magnitudes(:));
        H(i) = magsum;
    end

end
