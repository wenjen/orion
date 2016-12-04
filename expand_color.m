function ret=expand_color(color_points,data_spec,real_X)

ret=real_X'*0;
cut=data_spec.common_points_num;
color_cell_count=1;
for i=1:data_spec.view
    for j=1:data_spec.view
        if i<j && data_spec.double_match(i,j)>0
            for k=1:data_spec.double_match(i,j)
                ret(cut+k,:)=color_points{color_cell_count}(k,:);
            end
            color_cell_count=color_cell_count+1;
            cut=cut+data_spec.double_match(i,j);
        end
    end
end