function b = intensity_weighted_centroid2d(im,b,s)

[xn,yn] = size(im);

for i=1:size(b,1)
    idx = ellipse2d(xn,yn,b(i,1),b(i,2),s(1),s(2));        
    p = im(idx);
    [x,y] = ind2sub([xn,yn],idx);
    sp = sum(p);
    b(i,1) = sum(x .* p) / sp;
    b(i,2) = sum(y .* p) / sp;
end

end