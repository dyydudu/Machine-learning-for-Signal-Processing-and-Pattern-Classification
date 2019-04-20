% 1.

clc;
clear all;
close all;
u0=double(imread('inpaint_img.tif'));  % To read the input image to be inpainted.
D=imread('img_mask.tif');  % To read the corresponding mask required for inpainting.
subplot(121); 
imshow(uint8(u0));
subplot(122);
imshow(D); % To display the inputs in the single figure window.
u0 = mat2gray(u0);% converting to gray 
u0=im2double(u0); % converting the image to double
u0=u0(:); % vectorising the image
D=D(:); % vectorising the mask
N=length(D); % N = length of the image
u0(D(:,1)==0)=NaN ; %replacing the text with NaN in the inpaint image.
u0=reshape(u0,400,400); % reshaping the image back to the original size.
figure 
imshow(u0) % ploting the image with text.
title('image with text') 
