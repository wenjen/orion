function XY1 = labeling( inpath1,n)
%MANUALLY Summary of this function goes here
%   Detailed explanation goes here

addLabels = @(xy,str) text(xy(:,1),xy(:,2), ...
                           sprintf('%s',str), ...
                          'Color','r', ...
                          'HorizontalAlignment','center', ...
                          'VerticalAlignment','middle','FontSize',20);
im1 = imread(inpath1);
%[h1,~,~]=size(im1);

imshow(im1);

XY1 = zeros(n,2);

for i = 1:n
    title(sprintf('%i points left to pick',n + 1 - i));
    [XY1(i,1), XY1(i,2)] = ginput(1);
    title(sprintf(''));
    addLabels([XY1(i,1), XY1(i,2)],num2str(i));
end
%print (strcat('labeled_',inpath1),'-djpeg');
end

