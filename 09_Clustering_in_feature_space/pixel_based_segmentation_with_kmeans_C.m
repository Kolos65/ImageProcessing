function SEG = pixel_based_segmentation_with_kmeans_C(I, k)
% concatenate step1&2&3
% versionC: H feature space from HSV
    S = step1_C(I);
    A = step2(S, k);
    SEG = step3_C(A, I);
end
