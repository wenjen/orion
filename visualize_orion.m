function visualize_orion(real_X,M)
%VISUALIZE Summary of this function goes here
%   Detailed explanation goes here
    f = figure;
    info = draw_line_orion();
    lines = info.lines;
    plot_cell = cell(4 + length(lines),1);
    redraw(real_X,plot_cell,M);
    hold off;
    
    global theta;
    theta = zeros(3,1);
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2],'Position',...
                [30, 20, 30, 500], 'Callback', {@sliderx, real_X, plot_cell,M});
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2], 'Position',...
                [65, 20, 30, 500], 'Callback', {@slidery, real_X, plot_cell,M});            
    uicontrol(f,'Style','slider','Min',-180,'Max',180,'Value',0,...
                'SliderStep',[0.05 0.2], 'Position',...
                [100, 20, 30, 500], 'Callback', {@sliderz, real_X, plot_cell,M}); 
            
            
end