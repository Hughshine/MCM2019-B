function [y] = mysin(b,theta,i,n,delta,z)
%a�ֱ���ת����ת���ĽǶ�,i,��ǰ�����ı��,n�ܹ�����������,thetaת����y��ļн�,deltaΪ��һ������x��ļн�,zΪ�߶Ⱥ������ı�ֵ
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

N=[-sin(b)*cos(theta),-sin(theta)*sin(b),cos(b)];

y=(N(1)*cos((i-1)*2*pi/n+delta)+N(2)*sin((i-1)*2*pi/n+delta)+N(3)*z)/(1+z^2)^0.5;
end

