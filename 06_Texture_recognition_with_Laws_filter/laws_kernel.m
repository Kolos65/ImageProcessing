function H = laws_kernel(k)

    if ~(mod(k,1) == 0)
        error('The input (%.1f) is not an integer!',k)
    elseif k > 9 || k < 1
        error('The input (%d) is not in the range: [1,9]!',k);
    end
    
    L = [1;2;1] / 6;
    E = [1;0;-1] / 2;
    S = [1;-2;1] / 2;
    
    switch k
        case 1
            H = L.*L.';
        case 2
            H = L.*E.';
        case 3
            H = L.*S.';
        case 4
            H = E.*L.';
        case 5
            H = E.*E.';
        case 6
            H = E.*S.';
        case 7
            H = S.*L.';
        case 8
            H = S.*E.';
        case 9
            H = S.*S.';
    end
    
end