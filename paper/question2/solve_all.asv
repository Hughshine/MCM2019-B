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
My=zeros(9,9);
Mx=zeros(9,9);
for i=1:9
    for j=1:2
        for k=1:8
          Mx(i,j)=Mx(i,j)+sin((k-1)*pi/4)*F(i,k,j)*11/170/5;
          My(i,j)=My(i,j)+F(i,k,j)*11*cos((k-1)*pi/4)/170/5;   
        end
    end
end
h=0.11;
r=0.1;R=0.2;m=3.6;
Iyy=(R^2+r^2+R*r+2*h^2)*m/3/(R+r);
Ixx=Iyy;
Izz=2/3*(R^2+r^2+R*r)*h^2*m/(R+r);

a=zeros(9);b=zeros(9);da=zeros(9);db=zeros(9);d2a=zeros(9);d2b=zeros(9);c=zeros(9);dc=zeros(9);
for i=1:9
    for j=1:2
for k=1:1000
    d2b(i)=(Mx(i,j)*sin(c(i))+My(i,j)*cos(c(i))-2*(Iyy-Izz)*(-da(i)*cos(b(i)))*(da(i)*sin(b(i))+dc(i)))/Ixx+da(i)*dc(i)*cos(b(i));
    d2a(i)=((Mx(i,j)*cos(c(i))+My(i,j)*sin(c(i))+(Iyy-Izz)*(db(i))*(da(i)*sin(b(i))+dc(i)))/Iyy+da(i)*dc(i)*cos(b(i))+da(i)*db(i)*sin(b(i))+dc(i)*db(i)) /cos(b(i));
    temda=da(i);temdb=db(i);
    da(i)=da(i)+d2a(i)*1e-4;
    db(i)=db(i)+d2b(i)*1e-4;
    a(i)=a(i)+(da(i)+temda)/2*1e-4;
    b(i)=b(i)+(temdb+db(i))/2*1e-4;
end
    end
end
angle=zeros(1,9);
for i=1:9
    angle(i)=to_angle(a(i),b(i));
end

