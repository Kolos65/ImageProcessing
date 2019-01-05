function D = ord_dit_matrix(n)
    D0 = 0;
    D = D0;
    for i = 1:n
        D = [D.*4+0, D.*4+2;
             D.*4+3, D.*4+1];
    end
    D = D./(4^n);
end