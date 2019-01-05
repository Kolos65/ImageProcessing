function [x_tilde] = restoration(y, h, method, varargin)
       Y = fft2(y);
       H = psf2otf(h, size(Y));
       
       switch method
           case 'inverse'
               R = inverse_filter(H);
           case 'CLS'
               C = psf2otf(varargin{2},size(Y));
               R = CLS_filter(H,varargin{1},C);
           case 'wiener'
               n = varargin{1};
               N = fft2(n);
               P_NN = N .* conj(N);
               P_YY = Y .* conj(Y);
               R = wiener_filter(H, P_NN, P_YY);
           case 'wiener-white'
               var_noise = varargin{1};
               var_image = var(y);
               R = wiener_filter(H, var_noise, var_image);
           otherwise
               error('Method name is invalid!');
       end
       
       x_tilde = abs(ifft2(R.*Y));
end