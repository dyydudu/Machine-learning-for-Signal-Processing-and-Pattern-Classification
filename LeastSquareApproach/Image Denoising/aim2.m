clc
clear all

im=imread('cyclone-debbie.jpg'); %Read the cyclone image
im=im2double(im); %the intensity of the image is converted to double.
N=length(im);
figure
imshow(im); %showing the image
title('Input image');
y=imnoise(im,'gaussian',0,0.1); %Adding gaussian noise with mean=0 variance=0.1
figure
imshow(y);
title('Noise image with gaussian noisy');%showing the noisy image 
y1=y(:,:,1); % RGB layers of noisy image
y2=y(:,:,2);% RGB layers of noisy image
y3=y(:,:,3);% RGB layers of noisy image
e=ones(N,1);
D=spdiags([e -2*e e], 0:2, N-2, N);%D is a diagonal matrix of 2nd derivation with size N-2 X N
lambda=20;
F=speye(N)+lambda*D'*D; 
F=full(F); %sparse double to double is converted
% Column wise
x1=(inv(F)*y1)';
x2=(inv(F)*y2)';
x3=(inv(F)*y3)';
% Row wise least 
xr=(inv(F)*x1)';
xg=(inv(F)*x2)';
xb=(inv(F)*x3)';
%Concatenating all layers
yout(:,:,1)=xr;
yout(:,:,2)=xg;
yout(:,:,3)=xb;
figure
imshow(yout) %showing denoised image
title('Denoised Image');
psnr(y,im)
psnr(yout,im)