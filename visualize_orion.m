function visualize_orion(real_X,M,data_spec,color_points)
%VISUALIZE Summary of this function goes here
%   Detailed explanation goes here
    f = figure;
    info = draw_line_orion();
    l = info.lines_to_draw;
    global plot_cell;
    plot_cell = cell(length(real_X) + length(l),1);
    global expanded_color
    expanded_color=expand_color(color_points,data_spec,real_X);
    
    redraw(real_X,M,data_spec);
    hold off;
    
    global theta;
    theta = zeros(3,1);
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2],'Position',...
                [30, 20, 30, 500], 'Callback', {@sliderx, real_X,M,data_spec});
    
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2], 'Position',...
                [65, 20, 30, 500], 'Callback', {@slidery, real_X,M,data_spec});            
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2], 'Position',...
                [100, 20, 30, 500], 'Callback', {@sliderz, real_X,M,data_spec}); 
            
            
end