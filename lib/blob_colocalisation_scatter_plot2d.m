function blob_colocalisation_scatter_plot2d(im1,b1,b2,b1c,b2c,rx,ry)

[xs,ys] = size(im1); 

plot(b1(:,2)/1000,b1(:,1)/1000,'*g'); hold on; 
plot(b2(:,2)/1000,b2(:,1)/1000,'*r'); hold on; 
plot(b1c(:,2)/1000,b1c(:,1)/1000,'ob'); hold on; 
plot(b2c(:,2)/1000,b2c(:,1)/1000,'ob');
axis equal; axis tight; box on;

xlim([ry*1/1000,ry*ys/1000]); ylim([rx*1/1000,rx*xs/1000]);
xlabel('X [\mum]'); ylabel('Y [\mum]');  set(gca,'YDir','Reverse');

titlestring{1} = ['Particles channel 1 (green): ' num2str(size(b1,1)) ];
titlestring{2} = ['Particles channel 2 (red): '   num2str(size(b2,1)) ];
titlestring{3} = ['Colocalised (blue): '          num2str(size(b1c,1))];
title(titlestring);

end