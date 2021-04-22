function bestX=Desiered_point(z,vd)
% z=[5 700 pi/2 0 0 0 0 0 0 0];
% vd=1;
persistent Xd
%   vd=1;
    acc=.1/vd;
    vd=1000*vd;
    vs=1*vd; %velocity of the path
    vu=2*vd;
    ls=1600; %straight length
    ru=1000; %circle radius
    Tf=round(2*ls/vs+4*pi*ru/vu)+.5;
    t=0:acc:Tf;
     if max(size(Xd))~=length(t)
     Xd=zeros(4,length(t));
        for i=1:length(t)
        Xd(:,i)=timed_trajectory(t(i),vd)
        end
     end
bestX=timed_trajectory(0,vd);
    nearest=1500;
    for j=1:length(Xd(1,:))
        ppdir_err=atan2((-z(2)+Xd(2,j)),(-z(1)+Xd(1,j)));        
%         if (norm(z(1:2,i)-Xd2(1:2,j),2)<nearest  && abs(ppdir_err-z(3,i))<.4*pi && (-z(2,i)+Xd2(2,j))<0)
        if (norm([z(1)-Xd(1,j) z(2)-Xd(2,j)],2)<nearest && cos(ppdir_err-z(3))>.3)
            bestX=Xd(:,j);
            nearest=norm([z(1)-Xd(1,j) z(2)-Xd(2,j)],2)+cos(ppdir_err-z(3))*10;
        end
    end            
    
function xd=timed_trajectory(t,vd)    
    vs=1*vd; %velocity of the path
    vu=2*vd;
    ls=1600; %straight length
    ru=1000; %circle radius
    Tf=round(2*ls/vs+4*pi*ru/vu);
    t1=ls/vs;
    t2=ls/vs+2*pi*ru/vu;
    t3=2*ls/vs+2*pi*ru/vu;
    wr=.5*vu/ru; R=ru;
    if t<ls/vs
        xd=[0;vs*t;pi/2;vs];
    elseif t>=t1 && t<t2
        xd=[-ru+ru*sin(pi/2-wr*(t-t1));vs*t1+R*cos(pi/2-wr*(t-t1));
            asin(sin(wr*(t-t1)+pi/2));vs/2];
    elseif t>=t2 && t<t3
        xd=[-2*ru;ls-vs*(t-t2);-pi/2;vs];
    elseif t>=t3 && t<Tf
        xd=[-ru-ru*sin(pi/2-wr*(t-t3));-R*cos(pi/2-wr*(t-t3))
            asin(sin(wr*(t-t3)-pi/2));vs/2];
    elseif t>=Tf
        xd=[0;0;pi/2;0];
    end