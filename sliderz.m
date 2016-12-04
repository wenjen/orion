function plot_cell=sliderz( source, event, real_X, M)
%SLIDERZ Summary of this function goes here
%   Detailed explanation goes here
    global theta;
    theta(3) = source.Value;
    w_x = rotxd(theta(1)) * rotyd(theta(2)) * rotzd(theta(3)) *real_X;
    info = draw_line_orion();
    l = info.lines_to_draw;
%     for i=1:length(plot_cell)
%         delete(plot_cell{i});
%     end
    %plot_cell = cell(length(real_X) + length(l),1);
    redraw(w_x,M);

end

