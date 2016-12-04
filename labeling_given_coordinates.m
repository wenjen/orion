function  labeling_given_coordinates( filename,XY)
figure
%MANUALLY Summary of this function goes here
%   Detailed explanation goes here

addLabels = @(xy,str) text(xy(:,1),xy(:,2), ...
                           sprintf('%s',str), ...
                          'Color','r', ...
                          'HorizontalAlignment','center', ...
                          'VerticalAlignment','middle','FontSize',20);
im1 = imread(strcat(filename,'.jpg'));
%[h1,~,~]=size(im1);

imshow(im1);


for i = 1:size(XY,1)
    addLabels([XY(i,1), XY(i,2)],num2str(i));
end
print (strcat(filename,'_labeled'),'-dpng');
end

