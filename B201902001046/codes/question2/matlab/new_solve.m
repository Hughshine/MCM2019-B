format  shortE
clear F;
f=68.155;

F(:,:,1)= [f,f,f,f,f,f,f,f;
           f,f,f,f,f,f,f,f;
           f,f,f,f,f,f,f,f;
           80,f,f,f,f,f,f,f;
           80,80,f,f,f,f,f,f;
           80,f,f,80,f,f,f,f;
           90,f,f,f,f,f,f,f;
           f,80,f,f,80,f,f,f;
           f,f,f,f,80,f,f,80;];
F(:,:,2)=[90,80,80,80,80,80,80,80;
    90,90,80,80,80,80,80,80;
    90,80,80,90,80,80,80,80;
    80,80,80,80,80,80,80,80;
    80,80,80,80,80,80,80,80;
    80,80,80,80,80,80,80,80;
    90,80,80,80,80,80,80,80;
    90,80,80,90,80,80,80,80;
    90,80,80,90,80,80,80,80];

h=0.11;
r=0.1;R=0.2;m=3.6;
Iyy=(R^2+r^2+R*r+2*h^2)*m/3/(R+r);
Ixx=Iyy;
Izz=2/3*(R^2+r^2+R*r)*h^2*m/(R+r);
n=8;theta=[0,pi/8,3*pi/8,0,pi/8,3*pi/8,0,0,3*pi/8];

db=zeros(1,9);d2b=zeros(1,9);b=zeros(1,9);
 for i=1:9
 for j=1:20000  
     if j<10000
         k=1;
     else
         k=2;
     end
N=[-sin(b(i))*cos(theta(i)),-sin(theta(i))*sin(b(i)),cos(b(i))];
M=0;
for p=1:8
   mysin=(N(1)*cos((p-1)*2*pi/n)+N(2)*sin((p-1)*2*pi/n)+N(3)*11/170)/(1+121/170^2);
   M=M+F(i,p,k)*mysin*0.2*cos((p-1)*2*pi/n);
end
tempd2b=d2b(i);
d2b(i)=M/Iyy;
temp=db(i);
db(i)=db(i)+(tempd2b+d2b(i))/2*1e-5;
b(i)=b(i)+(db(i)+temp)/2*1e-5;
 end
 end
 for i=1:9
     b(i)=b(i)*180/pi;
 end