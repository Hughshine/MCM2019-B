format  shortE

h=0.11;
r=0.1;R=0.2;m=3.6;
H=0.10 ;
f=m*9.8/5/H;     %鼓水平面绳子末端高度
n=10;s=1000;
F1y=43.308;
F2y=47.196;
x=85;y=70;

Iyy=(R^2+r^2+R*r+2*h^2)*m/3/(R+r);
Ixx=Iyy;
Izz=2/3*(R^2+r^2+R*r)*h^2*m/(R+r);
theta=pi/12;
db=zeros(1,s);d2b=zeros(1,s);b=zeros(1,s);
 for i=1:s
     x=x+0.1;
     F= [x,x*sin(pi/15)/sin(2*pi/15),f,f,f,f,y,y*sin(pi/15)/sin(2*pi/15),f,f;
          92.65,92.65,92.65,92.65,92.65,92.65,92.65,92.65,92.65,92.65;];
 for j=1:3800  
     if j<2000
         k=1;
     else
         k=2;
     end
M=0;
for p=1:n
   M=M+F(k,p)*mysin(b(i),theta,p,n,pi/12,H/2)*0.2*cos((p-1)*2*pi/n);
end
tempd2b=d2b(i);
d2b(i)=M/Iyy;
temp=db(i);
db(i)=db(i)+(tempd2b+d2b(i))/2*1e-4;
b(i)=b(i)+(db(i)+temp)/2*1e-4;
 end
     if(abs(b(i)-0.00863)<1e-5)
        i
     end
 end
 for i=1:s
     b(i)=b(i)*180/pi;  
 end