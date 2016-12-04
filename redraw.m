function redraw(real_X,M,data_spec)
%close all
%plot_cell{1} = scatter3(real_X(1,:),real_X(2,:),real_X(3,:));
global plot_cell;
for i=1:length(plot_cell)
        delete(plot_cell{i});
end
info=draw_line_orion();
lines_to_draw=info.lines_to_draw;


axis_length=10;camera_size=1;
text(axis_length,0,0,'X')
text(0,axis_length,0,'Y')
text(0,0,axis_length,'Z')
line([0,axis_length],[0,0],[0,0],'LineWidth',4,'Color','b');
hold on
axis equal

line([0,0],[0,axis_length],[0,0],'LineWidth',4,'Color','g');

line([0,0],[0,0],[0,axis_length],'LineWidth',4,'Color','c');

for i=1:length(lines_to_draw)
    l=[real_X(:,lines_to_draw(1,i)),real_X(:,lines_to_draw(2,i))];
    plot_cell{i} = line(l(1,:),l(2,:),l(3,:),'LineWidth',4,'Color','r');
end
global expanded_color
for j=1:length(real_X)
    plot_cell{j+length(lines_to_draw)} = scatter3(real_X(1,j),real_X(2,j),real_X(3,j),15,expanded_color(j,:),'filled');
    hold on
end
meadow_base=[];
meadow=info.meadow;
for i=1:length(meadow)
    meadow_base=cat(2,meadow_base,real_X(:,meadow(i)));
end
%fill3(meadow_base(1,:),meadow_base(2,:),meadow_base(3,:),'g')
%camera=zeors(4,3,11);
%camera_ref=[[1 1 -1 -1]*camera_size;[1 -1 -1 1]*camera_size;[1 1 1 1]*camera_size;];
% for i=1:11
%     c=pinv(M(:,:,i))*camera_ref;
%     fill3(c(1,:),c(2,:),c(3,:),'g');
% end
hold off;
end