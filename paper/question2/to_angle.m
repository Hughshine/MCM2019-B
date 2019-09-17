function [theta] = to_angle(a,b)

%计算与xy平面的夹角 此处显示有关此函数的摘要
%   此处显示详细说明
OY=[cos(b),0,sin(b);
    0,1,0;
    -sin(b),0,cos(b);
    ];
OX=[1,0,0;
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
result=0;
for i=1:3
  result=res(i)*z(i)+result;
end
theta=acosd(result);
end

