function [Y]=fun_rot(axis_name,angle_ini,angle_fin)
if angle_ini<angle_fin
    dir=1;
else dir=-1;
end
if dir==1
    y=angle_ini:0.01:angle_fin;
else
    y=angle_fin:0.01:angle_ini;
end
%random('Normal',pi/10,pi/9);
n=1;

%interval=seqreverse(0.000001:0.009:0.5);
if angle_ini<angle_fin
    dir=1;
else dir=-1;
end

% flag=0;
%target=pi/4;
%error=target-y;

%axis_no=input('enter axis');

xpoints=-2:0.02:2;
xpoints(:,201)=[];
ypoints=zeros(200);
zpoints=zeros(200);


for i=1:length(y)

x1=[-1 -1 -1
 1 -1 -1
 1 1 -1
 -1 1 -1
 -1 -1 1 
 1 -1 1
 1 1 1
 -1 1 1];

x2=[x1(:,2),x1(:,1),x1(:,3)];
x3=[x1(:,3),x1(:,2),x1(:,1)];

rot=[1 sqrt(2)*cos(pi/4+dir*y(i)) sqrt(2)*sin(pi/4+dir*y(i)) % matrix for rotation
 1 sqrt(2)*cos(pi/4+dir*y(i)) sqrt(2)*sin(pi/4+dir*y(i))
 1 sqrt(2)*cos(pi/4-dir*y(i)) sqrt(2)*sin(pi/4-dir*y(i))
 1 sqrt(2)*cos(pi/4-dir*y(i)) sqrt(2)*sin(pi/4-dir*y(i))
 1 sqrt(2)*cos(pi/4-dir*y(i)) sqrt(2)*sin(pi/4-dir*y(i))  
 1 sqrt(2)*cos(pi/4-dir*y(i)) sqrt(2)*sin(pi/4-dir*y(i)) 
 1 sqrt(2)*cos(pi/4+dir*y(i)) sqrt(2)*sin(pi/4+dir*y(i));
 1 sqrt(2)*cos(pi/4+dir*y(i)) sqrt(2)*sin(pi/4+dir*y(i));];

roty=[rot(:,2),rot(:,1),rot(:,3)];

rotz=[rot(:,3),rot(:,2),rot(:,1)];

clf;

switch(axis_name)

    case 1
        x=x1.*rot;
    case 2
        x=x2.*roty;
    case 3
        x=x3.*rotz;
end

facs = [1 2 6 5
        2 3 7 6
        3 4 8 7
        4 1 5 8
        1 2 3 4
        5 6 7 8];
    
      % subplot(1,2,1);
      %x=x1.*rot;
      
%patch('Faces',facs,'Vertices',x,'FaceVertexCData',hsv(6),'FaceColor','flat');

patch('Faces',facs,'Vertices',x,'FaceColor','y');
axis on;
% axis tight;    
axis([-n*2 n*2 -n*2 n*2 -n*2 n*2]);

%view (-35,70);
hold off;
%hold on;
pause(0.00001);
end
