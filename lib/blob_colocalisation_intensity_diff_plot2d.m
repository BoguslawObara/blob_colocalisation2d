function [w,m,cc] = blob_colocalisation_intensity_diff_plot2d(im1,b1c,b2c,rx,ry)

[xs,ys] = size(im1);
v1 = []; v2 = [];
for i=1:size(b1c,1)
    v1(i) = b1c(i,4);
    v2(i) = b2c(i,4);
end

n = 5; cmap = jet(n);
m = max(abs(v1 - v2)); 
w = min(abs(v1 - v2));
d = abs(v1 - v2);
[~,e] = hist(d,n);

cc = zeros(size(b1c,1),3);
for i=1:size(b1c,1)
    j = 1;
    for k=1:n
        if d(i)>=(e(k)-(m-w)/(2*n)) && d(i)<(e(k)+(m-w)/(2*n))
            j = k;
        end
        if d(i)==(e(n)+(m-w)/(2*n))
            j = n;
        end
    end
    if j<1; j = 1; end;
    if j>n; j = n; end;    
    cc(i,:) = cmap(j,:);
end

scatter(b1c(:,2)/1000,b1c(:,1)/1000,20,cc,'filled','o');
colormap(cmap);
nt = 3; 
zl = get(gca,'ZLim'); 
set(gca,'ZTick',linspace(zl(1),zl(2),nt))
ch = colorbar;
t = get(ch,'ytick');
s = length(t);

f = w:(m-w)/(s-1):m;
fs = {};
for i=1:length(f)
    fs{i} = mat2str(f(i),2);
end
set(ch,'YTickLabel',fs)
axis equal; axis tight; box on;
xlim([ry*1/1000,ry*ys/1000]); ylim([rx*1/1000,rx*xs/1000]);
xlabel('X [\mum]'); ylabel('Y [\mum]'); set(gca,'YDir','Reverse');
title('Intensity Difference Map of Colocalized Particles');

end