function plot_cell=sliderx(source, event, real_X,M)
%SLIDERX Summary of this function goes here
%   Detailed explanation goes here
    global theta;
    theta(1) = source.Value;
    w_x = rotxd(theta(1)) * rotyd(theta(2)) * rotzd(theta(3)) *real_X;
    info = draw_line_orion();
    l = info.lines_to_draw;
%     for i=1:length(plot_cell)
%         fprintf('deleting')
%         plot_cell{i}
%         %delete(plot_cell{i});
%     end
    %plot_cell = cell(length(real_X) + length(l),1);
    redraw(w_x,M);
    
end

