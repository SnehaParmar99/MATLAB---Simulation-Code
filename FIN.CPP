#include <stdio.h>
#include<conio.h>
#include<iostream.h>

double mem(double,double,double,double);
void disp(double [2][5]);

void main()
{
clrscr();
/***************************************************************************************/
//Opening files to store results
FILE *fp1;
fp1=fopen("errorvals.txt","w");
FILE *fp2;
fp2=fopen("errorratevals.txt","w");
FILE *fp3;
fp3=fopen("ansvals.txt","w");

/***************************************************************************************/
//Initializing consequents,error,videal,verror and learning rate
double c[25]={-4,3,-2,1,0,
				-3,-2,-1,0,1
				,-2,-1,0,1,2,
				-1,0,1,2,3,
				0,1,2,3,4};
double e[2]={3.3,0.2}; //Layer 1 (Error and error rate)
double videal=0;
double verr=0;
double alpha=0.1;

/***************************************************************************************/
//Main Program

for(signed int a=0;a<=98;a++)
{

double a[2][5]={0};                //Initializing membership values to zero
//triangular membership function-related values
double l[5]={-5,-3,-1,0,1};       // lower limits
double u[5]={-1,0,1,3,5};         // upper limits
double m[5]={-3,-1,0,1,3};        // middle limits

//Layer 2

for(int i=0;i<2;i++)
	{
	for(int j=0;j<5;j++)
		{
	     a[i][j]=mem(l[j],u[j],m[j],e[i]); //calculation of 2x5 membership function values
	    }
    }

/***************************************************************************************/


/*
disp(a);
cout<<endl<<"======================"<<endl;
*/

//Layer 3

double beta[25]={0};             
int n=0;
for(i=0;i<5;i++)
	{
	for(int j=0;j<5;j++,n++)
		{
	     beta[n]=a[0][i]*a[1][j]; //degree of satisfaction of both memberships
       /*	cout<<"b="<<beta[n]<<" ";
       //	if(beta[n]>0)
	       //	c[n]++;
	//cout<<"beta["<<n<<"]= "<<beta[n]<<endl;
	    }
	//cout<<endl;
	*/
    }}

/***************************************************************************************/

//calculation for weighted mean

double v=0,num=0,ans=0;
for(n=0;n<25;n++)
   {
	num+=beta[n]*c[n];
	v+=beta[n];
    }

if(v!=0)
ans=num/v;
/*
ans=1/v;
*/
v=ans;  //action or torque

/*
cout<<"("<<e[0]<<","<<e[1]<<")="<<ans<<" "<<endl;
*/

//writing calculated value to files

fprintf(fp1,"%f,",e[0]);
fprintf(fp2,"%f,",e[1]);
fprintf(fp3,"%f,",ans);
videal=-e[0]/.12;  //calculating desired v
verr=videal+v;     //error in v
/*
cout<<e[0]<<" "<<videal <<" "<<v<<" "<<verr<<endl;
*/

//updation of consequents
if(verr!=0)
  {
   for(i=0;i<25;i++)
	c[i]=c[i]-alpha*verr*beta[i];
  }

if(e[0]<0)  //simulated result by change in error as per action
e[0]=e[0]+0.12*v;
else
e[0]=e[0]-0.12*v;
if(e[1]<0)
e[1]=e[1]+0.12*v;
else
e[1]=e[1]-0.12*v;
/*
cout<<"("<<e[0]<<","<<e[1]<<")="<<ans<<" ";
*/

}

cout<<endl<<endl;

fclose(fp1);
fclose(fp2);
fclose(fp3);

//printing final consequents
for(int i=0;i<25;i++)
	{
	cout<<c[i]<<" ";
	}

getch();
}
/***************************************************************************************/

//FUNCTION to calculate triangular membership

double mem(double l,double u,double m,double x)        //give limits of triangular membership function and value of error to get the degree of membership
{

if(x>l&&x<m)
	{
	return (x-l)/(m-l);
    }
else if(x>=m&&x<=u)
	return (x-u)/(m-u);
	else
	return 0;
}

void disp(double a[2][5])                             //to display a 2-d  2x5 array of floats
{
for(int i=0;i<2;i++)
	{
	for(int j=0;j<5;j++)
		{
	     cout<<a[i][j]<<" ";
	    }
	cout<<endl;
    }
}
