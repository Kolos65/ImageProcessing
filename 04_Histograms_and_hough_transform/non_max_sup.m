function [r_vect, t_vect] = non_max_sup(H, k, s)
    r_vect = zeros(k,1);
    t_vect = zeros(k,1);
    i = 1; %Needed so script5 works
    while k > 0
        [~, index] = max(H(:)); 
        z = [size(H,1),size(H,2)];
        [r, t] = ind2sub(z,index);
        r_vect(i) = r; %Could use k too, but script5... :(
        t_vect(i) = t;
        i = i + 1;
        x1 = max(1,r-s);
        x2 = min(size(H,1),r+s);
        y1 = max(1,t-s); 
        y2 = min(size(H,2),t+s);
        H(x1:x2,y1:y2) = 0;
        k = k - 1;
    end
end