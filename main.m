clc
clear all
close all
I = imread('3.PNG');

I=im2bw(I); 
BW = I;
%BW = edge(I,'sobel');
Step_r = 0.5;  
%�ǶȲ���0.1����λΪ����  
Step_angle = 0.1;  
%��СԲ�뾶2  
minr =20;  
%���Բ�뾶30  
maxr = 30;  
%��thresh*hough_space�����ֵΪ��ֵ��threshȡ0-1֮�����  
thresh = 1;  
circleParaXYR=[];  
%---------------------------------------------------------------------------------  
%��ʼ���  
[Hough_space,Hough_circle_result,Para] = Hough_circle(BW,Step_r,Step_angle,minr,maxr,thresh);  
circleParaXYR=Para;  
axis equal  
figure(2);  
imshow(BW,[]),title('��Ե');  
axis equal  
figure(3);  
imshow(Hough_circle_result,[]),title('�����');  
axis equal  
figure(4),imshow(I,[]),title('����ͼ�е�Բ')  
hold on;  
%---------------------------------------------------------------------------------  
%�Ժ�ɫ�߱�ǳ��ļ��Բ����Բ  
plot(circleParaXYR(:,2), circleParaXYR(:,1), 'r+');  
for k = 1 : size(circleParaXYR, 1)
    t=0:0.01*pi:2*pi;  
    x=cos(t).*circleParaXYR(k,3)+circleParaXYR(k,2);  
    y=sin(t).*circleParaXYR(k,3)+circleParaXYR(k,1);  
    plot(x,y,'r-');  
end  
