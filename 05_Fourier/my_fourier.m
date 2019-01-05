function [F] = my_fourier(I)
    F = zeros(size(I));
    [K1,K2] = size(I);
    for k1=1:K1
        for k2=1:K2
            temp=0;
            for n1=1:K1
                for n2=1:K2
                    temp=temp+I(n1,n2) * exp(-1i*2*pi*(k1-1)*(n1-1)/K1) * exp(-1i*2*pi*(k2-1)*(n2-1)/K2);
                end
            end
            F(k1,k2) = temp;
        end
    end

end