function [offset] = calc_offset(I)
   artificial_image = zeros(size(I));
   artificial_image(1:100,1:100) = 1;
   CrossCorr = conv2(I, rot90(conj(artificial_image), 2));
   CrossCorr = CrossCorr(size(I,1):end, size(I,2):end);
   [~, arg_max] = max(abs(CrossCorr(:)));
   [off_y, off_x] = ind2sub(size(CrossCorr), arg_max);
   offset =  [off_y, off_x];
end
