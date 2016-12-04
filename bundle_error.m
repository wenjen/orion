function error= bundle_error(mx,data_spec,keypoints)

if strcmp(data_spec.model,'affine')
    [cut,M]=affine_M(mx,data_spec);
elseif strcmp(data_spec.model,'projective')
    [cut,M]=projective_M(mx,data_spec);
else
    fprintf('Error')
end

x=cell(1,data_spec.view);
X=cell(1,data_spec.view);
match=cell(data_spec.view);


common_X=mx(cut+1:cut+data_spec.common_points_num*3);
cut=cut+data_spec.common_points_num*3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extract the non common match point, if image i and image j,( i<j )has mathcing
% points , a 1D array would be added to the match(i,j)
% match is a cell, match(i,j)i<=j is always empty
for i=1:data_spec.view
    for j=1:data_spec.view
        if i<j && data_spec.double_match(i,j)>0
            match{i,j}=mx(cut+1:cut+data_spec.double_match(i,j)*3);
            cut=cut+data_spec.double_match(i,j)*3;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load cut from match cell
x{1}=[common_X;match{1,2}];
for i=2:data_spec.view-1
    x{i}=[common_X;match{i-1,i};match{i,i+1}];
end
x{data_spec.view}=[common_X;match{data_spec.view-1,data_spec.view}];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% squeeze 1d data into 3d
for i=1:data_spec.view
    X{i}=[reshape(x{i},3,[]);ones(1,size(x{i},1)/3)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
error=0;
for i=1:data_spec.view
    x_proj=M(:,:,i)*X{i};
    for j=1:size(X{i},2)
        x_proj(:,j)=x_proj(:,j)./x_proj(3,j);
    end
    error=error+norm(keypoints{i}'-x_proj(1:2,:));
end




