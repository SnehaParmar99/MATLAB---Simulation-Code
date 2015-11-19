function [Y]=fun_be(pos1_angle,axis_n)

c=[-4,3,-2,1,0,
    -3,-2,-1,0,1,
    -2,-1,0,1,2,
    -1,0,1,2,3,
    0,1,2,3,4];

%**************************************************************************

%Layer 1 (Error in radians and error rate)

e=[pos1_angle,0.2]; 

% e(1)=random('Normal',0,pi/9)

videal=0.0;
verr=0.0;   
alpha=0.1;  %learning rate for updation of consequents

no=100;

errorvals=zeros(1,no);
errorratevals=zeros(1,no);
erroransvals=zeros(1,no);

target=0;

for a1=1:no

a=zeros(2,5);           %Initializing membership values to zero

%triangular membership function-related values
l=[-50,-3,-1,0,1];      % lower limits
u=[-1,0,1,3,50];        % upper limits
m=[-3,-1,0,1,3];        % middle limits

%**************************************************************************
%Layer 2

for i=1:2
	
	for j=1:5
		
	     a(i,j)=mem(l(j),u(j),m(j),e(i)); %calculation of 2x5 membership function values
         end
end

%***************************************************************************************/

%Layer 3

beta=zeros(1,25);             
n=1;
for i=1:5
	
	for j=1:5
		
	     beta(n)=a(1,i)*a(2,j);
         n=n+1;
         %degree of satisfaction of both memberships
    end
end


%***************************************************************************************/

%calculation for weighted mean

v=0.0;
num=0.0;
ans=0.0;

for n=1:25
    num=num+beta(n)*c(n);
	v=v+beta(n);
end

if(ne(v,0))
ans=num/v;
end
v=ans; %action or torque


errorvals(a1)=e(1);
errorratevals(a1)=e(2);
erroransvals(a1)=ans;

videal=-e(1)/0.12;  %calculating desired v
verr=videal+v;     %error in v to update it 


%updation of consequents
if(ne(verr,0))
   for i=1:25
	c(i)=c(i)-alpha*verr*beta(i);
   end
end

% --------to see graphically----------
%      pos1=e(1);
eprev=e(1);

if(e(1)<0)  %simulated result by change in error as per action
e(1)=e(1)+0.1*v;
else
e(1)=e(1)-0.1*v;
end

add=v+0.00001*v;
anglefin= add/0.00001/10000*pi/180   ;

 %(integral of torque wrt time)/moment of inertia*time
 
 fun_rot(axis_n,eprev,anglefin);

e(2)=(eprev-e(1))/0.6;
%e(1)=e(1)+random('Normal',0.5,0.5);

flagg=0;
if abs(e(1))<=0.001
    flagg=1;
    break;
end

end


%printing final consequents
% for i=1:25
% c(i)
% end

%plot(errorvals,'--rs');
%plot(errorratevals,'--rs');
%plot(erroransvals,'--rs');

%-----important results
%subplot(1,2,2);
plot(errorvals,erroransvals,'--rs');
 xlabel('error');
 ylabel('torque');

%plot(errorratevals,erroransvals,'--rs');

%------Simulation results
% x1=1:100;
% [AX,H1,H2] = plotyy(x1,errorvals,x1,errorratevals,'plot');
% set(get(AX(1),'Ylabel'),'String','Error');
% set(get(AX(2),'Ylabel'),'String','Error rate');
% xlabel('One to Hundred iterations');
% title('Simulation Results');
% set(H1,'LineStyle','--');
% set(H2,'LineStyle',':');


%  xlabel('error');
%  ylabel('iteration');
