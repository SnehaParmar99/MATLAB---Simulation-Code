function[ans] =mem(l,u,m,x)        %give limits of triangular membership function and value of error to get the degree of membership

if((x>l)&(x<m))
	ans=(x-l)/(m-l);
else if(x>=m&&x<=u)
	ans=(x-u)/(m-u);
    else
   ans=0;
    end
end