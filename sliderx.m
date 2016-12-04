function sliderx(source, event, real_X,M,data_spec)
%SLIDERX Summary of this function goes here
%   Detailed explanation goes here
    global theta;
    theta(1) = source.Value;
    w_x = rotxd(theta(1)) * rotyd(theta(2)) * rotzd(theta(3)) *real_X;
    redraw(w_x,M,data_spec);
    
end

