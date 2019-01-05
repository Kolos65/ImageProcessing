function [y, h, n] = degradation(x, kernel, noise)
    
    switch kernel %strcmp(to check strings)
        case 'average'
            h = fspecial('average',[5,5]);
        case 'gaussian'
            h = fspecial('gaussian',[9,9],1);
        case 'motion'
            h = fspecial('motion',11,30);
        otherwise
            error('Unknown Kernel name!');
    end
    
    switch noise
        case 'off'
            n = zeros(size(x));
        case 'white'
            n = randn(size(x));
            n = n .* sqrt(0.001); 
        case 'pink'
            n = pinknoise(size(x));
            n = n .* 0.05;
        otherwise
            error('Unknown Noise name!')
    end
    
    y = imfilter(x,h,'replicate','same','conv') + n;
    
end