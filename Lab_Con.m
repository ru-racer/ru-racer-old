function  [U,Xd_]=Lab_Con(z,t,K,vd)
%   z=rand(10,1);
%   t=0;
%   K=[1;.1];
%   vd=1;
Xd_=Desiered_point(z,vd);
x=z(1)/1000;y=z(2)/1000; teta=z(3);
v=z(4)/1000;
tetad=Xd_(3);
yd=Xd_(2); xd=Xd_(1);
vd=Xd_(4)/1000;
kp2=.0001;
ke=K(1); kp1=K(2);
derr=atan2(yd-y,xd-x);
kp=kp1*exp(-kp2*norm(v));
delta=(kp*(1*sin(-teta+derr)))+ke*(sin(tetad-teta));
delta=sign(delta)*min(abs(delta),pi/8);
U=[t delta*100/(pi/8) 192*vd 0 0 0 0];