function [cut,M]=affine_M(mx,data_spec)

m=mx(1:data_spec.MX_split);
M=reshape(m,2,4,data_spec.view);
M=[M;repmat([0,0,0,1],1,1,data_spec.view)];
cut=data_spec.MX_split;