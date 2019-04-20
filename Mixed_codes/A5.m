clear all
clc

x=[1 2 3 4] % 1st signal
y=[5 6 7] % 2nd signal
timedomain_conv=conv(x,y) % convolving the two signals in time domain.

m=length(x); % m:length of the 1st signal
n=length(y); % n:length of the 2nd signal
l=m+n-1; % l:length of the convolved sequence

w=fft(x,l); % fft of the 1st signal
z=fft(y,l); % fft of the 2nd signal
a=w.*z; % multipying the coefficients of the signals(frequency domain).
frequencydomain_mul=ifft(a) % converting it back to time domain using ifft.
