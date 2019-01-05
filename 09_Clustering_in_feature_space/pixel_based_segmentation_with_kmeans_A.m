function SEG = pixel_based_segmentation_with_kmeans_A(I, k)
% concatenate step1&2&3
% versionA: RGB feature space
    S = step1_A(I);
    A = step2(S, k);
    SEG = step3_A(A, I);
end
