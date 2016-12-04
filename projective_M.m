function [cut,M]=projective_M(mx,data_spec)

f=mx(1);skew=mx(2);cx=mx(3);cy=mx(4);
f=f*4.15;
K=[f skew cx; 0 f cy;0 0 1];
cut=4;
M=zeros(3,4,data_spec.view);
M(:,:,1)=[K zeros(3,1)];

angle_scale=180;
for i=2:data_spec.view
    Rx=mx(cut+1);Ry=mx(cut+2);Rz=mx(cut+3);
    Tx=mx(cut+4);Ty=mx(cut+5);Tz=mx(cut+6);
    R=rotxd(Rx*angle_scale)*rotyd(Ry*angle_scale)*rotzd(Rz*angle_scale)*1;
    T=[Tx;Ty;Tz];
    M(:,:,i)=K*[R T];
    cut=cut+6;
    
end

