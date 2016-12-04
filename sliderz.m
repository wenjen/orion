function sliderz( source, event, real_X, M,data_spec)
%SLIDERZ Summary of this function goes here
%   Detailed explanation goes here
    global theta;
    theta(3) = source.Value;
    w_x = rotxd(theta(1)) * rotyd(theta(2)) * rotzd(theta(3)) *real_X;
    redraw(w_x,M,data_spec);

end

