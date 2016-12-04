function sliderx(source, event, real_X, plot_cell,M)
%SLIDERX Summary of this function goes here
%   Detailed explanation goes here
    global theta;
    theta(1) = source.Value;
    w_x = rotxd(theta(1)) * rotyd(theta(2)) * rotzd(theta(3)) *real_X;
    for i=1:length(plot_cell)
        delete(plot_cell{i});
    end
    plot_cell = cell(4 + length(lines),1);
    redraw(w_x, plot_cell,M);
    
end

