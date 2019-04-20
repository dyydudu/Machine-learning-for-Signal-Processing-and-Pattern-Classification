clc; 
clear all; 
close all; 
x=[4 2 6 -2 4 6 2 2]; 
% Wavelet Decomposition 
[c s]=wavedec(x,1,'haar'); % c is wavelet coefficients(length will be same as sequence legnth
c
% 1 is the level of decompostion.
[W1, W2]=wfilters('haar','d'); %W1 is low pass filter and W2 is high pass filter
c1=conv(x,(W1)); %conv of sequence with low pass filter 
c2=conv(x,(W2)); %conv of sequence with high pass filter
c1_f=c1(2:2:end); % down sampling 
c2_f=c2(2:2:end); % down sampling 
C=[c1_f c2_f] % apending the down sampled values. c and C are same

% Wavelet Reconstrcution 
x1=waverec(c,s,'haar'); %reconstructing the wave using waverec
[R1, R2]=wfilters('haar','r'); % R1,R2 are low pass and high pass filter resp.
r1 = upsample(c1_f,2); %upsampling the down sampled values(which came from low pass) making the sequence big again
r2 = upsample(c2_f,2); %upsampling the down sampled values(which came from high pass) making the sequence big again
r1_f=conv(r1,R1); % convolution between upsampled vector and low pass filter
r2_f=conv(r2,R2); % convolution between upsampled vector and high pass filter
X=r1_f+r2_f % adding to get the original value
x % X == x So sequence was reconstructed properly 

