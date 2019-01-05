function [mass_x, mass_y] = find_center(MASK)
% MASK: logical array (only zeros and ones).
%
% mass_x: coordinate of center of mass (horizontal), integer
% mass_y: coodrinate of center of mass (vertical), integer
    r = 1:size(MASK,2);
    c = 1:size(MASK,1);
    [X,Y] = meshgrid(r,c); 
    masked_x = X .* MASK;
    masked_y = Y .* MASK;
    mass_x = round(sum(masked_x(:)) / sum(MASK(:)));
    mass_y = round(sum(masked_y(:)) / sum(MASK(:)));
end