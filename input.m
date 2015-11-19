side= 0.1;
mass= 1.33;

ixx=mass*side^(2)/6 ; %moments of inertia..find from NASA database
iyy=ixx ;
izz=ixx;


wx_in=0 ; %angular velocities...assume initial velocities
wy_in=0;
wz_in=0 ;
% wx=0.1 ;
% wy=0.1 ;
% wz=0.1 ;
delwx=0 ; %rate of change of angular velocities
delwy=0 ;
delwz=0 ;
delt=0.1 ;
mcx=0 ; %control torques...as generated from control system
mcy=0 ;
mcz=0 ;

re=6400*10^(3);
rorbit=36000*10^(3);
a=re+rorbit;

alpha=0.1;
fact1=exp(-1*alpha*a);
mdx=fact1; %disturbance torques....use random disturbances
mdy=0;
mdz=0;

for iter=0:1:10
%calculating angular velocities from torques 
exp1='ixx*(wx-wx_in)/delt+(izz-iyy)*wy*wz-mcx-mdx';
exp2='iyy*(wy-wy_in)/delt+(ixx-izz)*wz*wx-mcy-mdy';
exp3='izz*(wz-wz_in)/delt+(iyy-ixx)*wx*wy-mcz-mdz';

sol1=solve(exp1,exp2,exp3);
sol1.wx=eval(sol1.wx);
sol1.wy=eval(sol1.wy);
% sol1.wz=eval(sol1.wz);
del
wx_in=wx;
wx_in=wy;
wx_in=0;

%angular velocity of orbit (Kepler's 3rd law)
w0=(3.98*10^(14)/a^(3))^(0.5);

roll=0 ;
pitch=0 ;
yaw= 0;
roll_rate=wx+w0*yaw ;
pitch_rate=wy+w0 ;
yaw_rate=wz+w0*-1*roll;

%calculating attitude angles from angular velocities
roll_fin=roll_rate*delt+roll
pitch_fin=pitch_rate*delt+pitch
yaw_fin=yaw_rate*delt+yaw


end

