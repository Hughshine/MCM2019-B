function [y] = mysin1(a,b,i,n)%a,b�ֱ���x,y��ת���ĽǶ�,i,��ǰ�����ı��,n�ܹ�����������
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
OY=[cos(b),0,sin(b);%��Y�����ת����
    0,1,0;
    -sin(b),0,cos(b);
    ];
OX=[1,0,0;         %��x�����ת����
    0,cos(a),-sin(a);
     0,sin(a),cos(a);
     ];
 
z=[0,0,1];t=[0,0,0];res=[0,0,0];

   for i=1:3
    temp=0;
    for j=1:3
        temp=temp+OY(i,j)*z(j);
    end
    t(i)=temp;
   end

 for i=1:3
    temp=0;
    for j=1:3
        temp=temp+OX(i,j)*t(j);
    end
    res(i)=temp;

end
y=(res(1)*cos((i-1)*2*pi/n)+res(2)*sin((i-1)*2*pi/n)+res(3)*11/170)/(1+121/170^2);
end
