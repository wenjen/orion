% contours may not be of same lateral, so don't pile them up!!
function info=draw_line_orion()
contour=cell(1,5);
contour{1}=[6 7 9 8];
line1=[1,5;2 3;10 4];
line2=[11 12; 12 13; 13 14; 14 15; 15 16; 16 17; 10 18; 18 19; 19 20; 20 14];

line_set=[contour{1};contour{1}(2:end) contour{1}(1)];
%line_set=[line_set [contour{2};contour{2}(2:end) contour{2}(1)]];
%line_set=[line_set [contour{3};contour{3}(2:end) contour{3}(1)]];
%line_set=[line_set [contour{4};contour{4}(2:end) contour{4}(1)]];
%line_set=[line_set [contour{5};contour{5}(2:end) contour{5}(1)]];
line_set=[line_set line1'];% line2'];
meadow=[3,4,5];
info=struct('lines_to_draw',line_set,'meadow',meadow);

