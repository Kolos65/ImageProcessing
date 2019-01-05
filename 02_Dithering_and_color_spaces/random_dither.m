function B = random_dither(A)
    R = rand(size(A,1),size(A,2));
    C = A + R;
    B = C > 1;
end