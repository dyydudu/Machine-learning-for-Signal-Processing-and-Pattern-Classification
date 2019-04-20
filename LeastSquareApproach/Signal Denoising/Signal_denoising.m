% 1.
clc;
clear all;
close all;

load data.txt;  %loading the data
y = data;       % data value
N = length(y); %taking the length of y

figure(1)
plot(y)     %ploting the data
title('Data')

e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);%D is a diagonal matrix of 2nd derivation with size N-2 X N
lam = 50; % lamda taking as 50
F = speye(N) + lam * D' * D;  % F is a banded matrix
x = F \ y;  % Matlab uses a fast solver for banded systems

figure(2)
plot(x) %ploting the obtained denoised signal

figure;
subplot(2,1,1);plot(y);title('Data')
subplot(2,1,2);plot(x);title('Least squares smoothing')

