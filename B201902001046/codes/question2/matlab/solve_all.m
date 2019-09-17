format  shortE
F(:,:,2)=[ 90,80,80,80,80,80,80,80;
    90,90,80,80,80,80,80,80;
    90,80,80,90,80,80,80,80;
    80,80,80,80,80,80,80,80;
    80,80,80,80,80,80,80,80;
    80,80,80,80,80,80,80,80;
    90,80,80,80,80,80,80,80;
    90,80,80,90,80,80,80,80;
    90,80,80,90,80,80,80,80;];
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
h=0.11;
r=0.1;R=0.2;m=3.6;
Iyy=(R^2+r^2+R*r+2*h^2)*m/3/(R+r);
Ixx=Iyy;
Izz=2/3*(R^2+r^2+R*r)*h^2*m/(R+r);
n=8;
a=zeros(9);b=zeros(9);da=zeros(9);db=zeros(9);d2a=zeros(9);d2b=zeros(9);c=zeros(9);dc=zeros(9);
for i=1:9
 
for k=1:20000
    if k<=10000
        j=1;
    else
        j=2;
    end
    Mx=0;My=0;
    for m=1:n
    Mx=Mx+mysin(a(i),b(i),m,n)*sin((m-1)*2*pi/n)*F(i,m,j)*0.2;
    My=My+mysin(a(i),b(i),m,n)*cos((m-1)*2*pi/n)*F(i,m,j)*0.2;
    end
    d2b(i)=(Mx*sin(c(i))+My*cos(c(i))-2*(Iyy-Izz)*(-da(i)*cos(b(i)))*(da(i)*sin(b(i))+dc(i)))/Ixx+da(i)*dc(i)*cos(b(i));
    d2a(i)=((Mx*cos(c(i))+My*sin(c(i))+(Iyy-Izz)*(db(i))*(da(i)*sin(b(i))+dc(i)))/Iyy+da(i)*dc(i)*cos(b(i))+da(i)*db(i)*sin(b(i))+dc(i)*db(i)) /cos(b(i));
    temda=da(i);temdb=db(i);
    da(i)=da(i)+d2a(i)*1e-5;
    db(i)=db(i)+d2b(i)*1e-5;
    a(i)=a(i)+(da(i)+temda)/2*1e-5;
    b(i)=b(i)+(temdb+db(i))/2*1e-5;
end
    
end
angle=zeros(1,9);
for i=1:9
    angle(i)=to_angle(a(i),b(i));
end

