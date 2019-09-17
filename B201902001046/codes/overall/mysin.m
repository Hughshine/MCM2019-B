function [y] = mysin(b,theta,i,n,delta,z)
%a分别绕转轴轴转动的角度,i,当前的力的标号,n总共的力的数量,theta转轴与y轴的夹角,delta为第一个力与x轴的夹角,z为高度和绳长的比值
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

N=[-sin(b)*cos(theta),-sin(theta)*sin(b),cos(b)];

y=(N(1)*cos((i-1)*2*pi/n+delta)+N(2)*sin((i-1)*2*pi/n+delta)+N(3)*z)/(1+z^2)^0.5;
end

