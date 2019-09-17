format  shortE
n=8;%力的总数量
%力的序号第i个力是在(cos((i-1)*2*pi/n),sin((m-1)*2*pi/n))方向上,即从x正半轴出发,逆时针旋转.
f=68.155;
F0= [f,f,f,f,f,f,f,f;];    
h=0.11;
r=0.1;R=0.2;m=3.6;
Iyy=(R^2+r^2+R*r+2*h^2)*m/3/(R+r);
Ixx=Iyy;
Izz=2/3*(R^2+r^2+R*r)*h^2*m/(R+r);
num=1000;
a=zeros(1,num);b=zeros(1,num);da=zeros(1,num);db=zeros(1,num);d2a=zeros(1,num);d2b=zeros(1,num);c=0;dc=0;

 for i=1:num
    F(:,:,i)=normrnd(80,5^0.5,[1,n]);
for k=1:5000
    Mx=0;My=0;
    for m=1:n
    Mx=Mx+mysin1(a(i),b(i),m,n)*sin((m-1)*2*pi/n)*F(1,m,i)*0.2;
    My=My+mysin1(a(i),b(i),m,n)*cos((m-1)*2*pi/n)*F(1,m,i)*0.2;
    end
    d2b(i)=(My-2*(Iyy-Izz)*(-da(i)*cos(b(i)))*(da(i)*sin(b(i)))) /Ixx;
    d2a(i)=(Mx+(Iyy-Izz)*(db(i))*(da(i)*sin(b(i))))/Iyy+da(i)*db(i)*sin(b(i)) /cos(b(i));
    temda=da(i);temdb=db(i);
    da(i)=da(i)+d2a(i)*1e-4;
    db(i)=db(i)+d2b(i)*1e-4;
    a(i)=a(i)+(da(i)+temda)/2*1e-4;
    b(i)=b(i)+(temdb+db(i))/2*1e-4;
end
 end
angle=zeros(1,num);
for i=1:num
    angle(i)=to_angle(a(i),b(i));
end

