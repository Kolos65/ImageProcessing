function [ filtered_space ] = mean_shift_filtering(feature_space, bandwidth, conv_threshold)
    filtered_space = feature_space;
    for index=1:size(feature_space,1)
        mode = find_mode(feature_space, index, bandwidth, conv_threshold);
        filtered_space(index,:) = mode;
    end
end