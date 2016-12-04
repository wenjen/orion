clear all; clc;close all
include_sift=false;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load('orion_10_common_11_view.mat')
load('bk/common_points_color.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% step 0: common data for affine and projective
data_spec=struct('double_match',double_match,'view',view,'common_points_num',common_points_num);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% step 1 : initializing with affine 
model_index=8;
MX_split=view*model_index;
mx_initial = rand(MX_split+(common_points_num+sum(double_match(:)))*3,1);

[data_spec(:).model]='affine';
[data_spec(:).MX_split]=MX_split;

fun = @(mx)bundle_error(mx,data_spec,keypoints);
options = optimoptions('fminunc','Display','final-detailed','Algorithm','quasi-newton','MaxIterations', 900000,'MaxFunctionEvaluations',900000);
[mx_affine,error] = fminunc(fun,mx_initial,options);

%[cut,M]=projective_M(mx,data_spec);
affine_x_out=mx_affine(MX_split+1:end);
affine_X=reshape(affine_x_out,3,[]);
%save('MX_test','real_X','M')
%[~,M]=affine_M(mx,data_spec)
%visualize_orion(affine_X,M)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% step 2 : use the x coordinate plus random camera parameter to initialize
model_index=6;model_offset=4;
MX_split=(view-1)*model_index+model_offset;
mx_initial=[rand(MX_split,1);affine_x_out];

[data_spec(:).model]='projective';
[data_spec(:).MX_split]=MX_split;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fun = @(mx)bundle_error(mx,data_spec,keypoints);
options = optimoptions('fminunc','Display','final-detailed','Algorithm','quasi-newton','MaxIterations', 900000,'MaxFunctionEvaluations',900000);
[mx_projective,error] = fminunc(fun,mx_initial,options);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

projective_x_out=mx_projective(MX_split+1:end);
projective_X=reshape(projective_x_out,3,[]);
%save('MX_test','real_X','M')
[~,M]=projective_M(mx_projective,data_spec);
visualize_orion(projective_X,M)

