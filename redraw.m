function redraw(w_x,plot_cell,M)
%close all
plot_cell{1} = scatter3(w_x(1,:),w_x(2,:),w_x(3,:));
hold on
axis equal
axis_length=10;camera_size=1;
text(axis_length,0,0,'X')
text(0,axis_length,0,'Y')
text(0,0,axis_length,'Z')
plot_cell{2} = line([0,axis_length],[0,0],[0,0],'LineWidth',4,'Color','b');
plot_cell{3} = line([0,0],[0,axis_length],[0,0],'LineWidth',4,'Color','g');
plot_cell{4} = line([0,0],[0,0],[0,axis_length],'LineWidth',4,'Color','c');
info=draw_line_orion();
lines=info.lines;
for i=1:length(lines)
    l=[w_x(:,lines(1,i)),w_x(:,lines(2,i))];
    plot_cell{4 + i} = line(l(1,:),l(2,:),l(3,:),'LineWidth',4,'Color','r');
end
meadow_base=[];
meadow=info.meadow;
for i=1:length(meadow)
    meadow_base=cat(2,meadow_base,w_x(:,meadow(i)));
end
fill3(meadow_base(1,:),meadow_base(2,:),meadow_base(3,:),'g')
%camera=zeors(4,3,11);
%camera_ref=[[1 1 -1 -1]*camera_size;[1 -1 -1 1]*camera_size;[1 1 1 1]*camera_size;];
% for i=1:11
%     c=pinv(M(:,:,i))*camera_ref;
%     fill3(c(1,:),c(2,:),c(3,:),'g');
% end
hold off;
end