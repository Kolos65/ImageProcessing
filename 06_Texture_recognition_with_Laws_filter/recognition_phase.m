function ClassMap = recognition_phase(I, MODEL)

    ClassMap = zeros(size(I));
    N = ones(3,3)/9;
    B = cell([1,9]);
    for k=1:9
        B2 = conv2(I,laws_kernel(k),'same').^2;
        Bx = conv2(B2,N,'same');
        B{k} = Bx;
    end
    
    BB = cat(3,B{:});
    sum_abs_diff = zeros(1,size(MODEL,1));
    
   for i=1:size(I,1)
       for j=1:size(I,2)
           for n=1:size(MODEL,1)
               diff = squeeze(BB(i,j,:)).' - MODEL(n,:);
               sum_abs_diff(n) = sum(abs(diff));
           end
           [~,min_n] = min(sum_abs_diff);
           ClassMap(i,j) = min_n;
       end
   end
    
end