% 1.
clc;
clear all;
i=imread('cameraman.tif'); % cameraman.tif is a gray built in image
i=im2double(i);
imshow(i); %showing the image
j=imnoise(i,'speckle',0.5); %noise is added to the image
imshow(j) %showing the noisy image
title('Noisy image')
N=size(j,1);
e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);%D is a diagonal matrix of 2nd derivation with size N-2 X N
lam = 10; % lamda taking as 50
F = speye(N) + lam * D' * D;  % F is a banded matrix
x = inv(F) * j; % column wise denoising
x=x'; % transposing to do row wise denoising
y1=inv(F) * x; % column wise denoising but as the image is transposed, its row wise denoising.
y1=y1'; %Transposing the output to get the origial ouput.
figure;
imshow(y1);
title('Denoised image')
%image is denoised in row wise and column wise


