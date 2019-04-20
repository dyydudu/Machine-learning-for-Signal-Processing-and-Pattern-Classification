clc;
clear all
close all
% A.
n=256; % size is 256
axis([1 n 0 1]); % makes axis x from 0 to 256, y from 0 to 1
x=MakeSignal('Piece-Regular',n); % making signal of size 256
x=rescale(x,0.05,0.95); %rescaling  x
plot(x) % plotting x
% B.
x1=fft(x) % computing fft of original signal
figure
stem(x1) % ploting
% C. 
x1(81:256)=0  % making coefficients between 81 to 256 as 0.
figure
stem(x1) %ploting 
% D.
xf=ifft(x1); % reconstructing the signal
figure
plot(real(xf)) % ploting the reconstructed signal
% E.
[c s]=wavedec(x,4,'haar'); % c is wavelet coefficients(length will be same as sequence legnth
figure 
stem(c) % ploting
% F.
c(81:256)=0 % making coefficents between 81 and 256 as 0 
figure
stem(c) %ploting 
% G.
xw=waverec(c,s,'haar'); %reconstructing the signal using waverec
figure
plot(xw) % ploting the reconstructed signal
% H
psnr_fourier_original=psnr(xf,x); % calculating psnr between fourier and orginal signal
psnr_fourier_original
%I
psnr_wavelet_original=psnr(xw,x); % calculating psnr between wavelet and orginal signal
psnr_wavelet_original
%J
figure
plot(1:n,x); % plotting original signal
hold on
plot(1:n,xf,'g.');  % plotting fourier reconstructed signal
hold on
plot(1:n,xw,'b*');  % plotting wavelet reconstructed signal
hold on
